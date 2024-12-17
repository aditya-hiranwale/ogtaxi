import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';
import 'package:ogtaxi/src/features/home/controller/home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/taxilist_model.dart';

class TaxiDetailCtlr extends GetxController {
  //
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Active index for carousel
  var activeIndex = 0.obs;
  // Observable to track loading state
  final RxBool isLoading = false.obs;

  // Update the active index
  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }

  //book taxi
  Future<void> bookTaxi(TaxiListModel item, double distance) async {
    isLoading.value = true;
    try {
      final currentUser = AuthRepo.instance.firebaseUser.value;
      final taxiId = item.taxiId;
      log("This is itemId used to fetch taxiRef: $taxiId");

      final taxiRef = _firestore.collection('taxiList').doc(taxiId);
      final bookingRef = _firestore.collection('bookingData').doc();
      final transaction = _firestore.batch();

      // Fetch taxi document
      final taxiDoc = await taxiRef.get();
      log("Fetching taxi document: ${taxiDoc.data()}");

      if (!taxiDoc.exists) {
        Get.snackbar("Taxi Unavailable", "The selected taxi does not exist.");
        log("Taxi document does not exist, taxiId: $taxiId");
        return; // Taxi document doesn't exist
      }

      final docExists = taxiDoc.data()?['isAvailable'];
      log("Taxi document availability status: $docExists");

      if (currentUser == null) {
        Get.snackbar("Login Required", "Please log in to book a taxi.");
        log("Login required");
        return; // User not logged in
      } else if (docExists == null || docExists == false) {
        Get.snackbar(
            "Taxi Unavailable", "The selected taxi is already booked.");
        log("Taxi unavailable: taxiId $taxiId, isAvailable: $docExists");
        return; // Taxi is already booked or isAvailable is null
      } else {
        // Calculate total cost
        final totalCost = distance * item.pricePerKm;

        // Log booking data to be added
        log("Preparing booking data: ${{
          'bookingId': bookingRef.id,
          'taxiId': taxiId,
          'userId': currentUser.uid,
          'taxiName': item.taxiName,
          'taxiDriverName': item.taxiDriverName,
          'taxiType': item.taxiType,
          'pricePerKm': item.pricePerKm,
          'startLoc': item.startLoc,
          'endLoc': item.endLoc,
          'images': item.images,
          'totalCost': totalCost,
          'bookingTime': FieldValue.serverTimestamp(),
          'status': true,
        }}");

        // Add booking data to Firestore
        transaction.set(bookingRef, {
          'bookingId': bookingRef.id,
          'taxiId': taxiId,
          'userId': currentUser.uid,
          'taxiName': item.taxiName,
          'taxiDriverName': item.taxiDriverName,
          'taxiType': item.taxiType,
          'pricePerKm': item.pricePerKm,
          'startLoc': item.startLoc,
          'endLoc': item.endLoc,
          'images': item.images,
          'totalCost': totalCost,
          'bookingTime': FieldValue.serverTimestamp(),
          'status': true,
        });

        // Update taxi availability to false
        transaction.update(taxiRef, {'isAvailable': false});
        log("Taxi availability updated to false for taxiId: $taxiId");

        // Commit the transaction
        await transaction.commit();
        log("Transaction committed successfully");

        Get.snackbar(
          "Booking Success",
          "Your booking for ${item.taxiName} is confirmed.\nTotal Cost: ₹$totalCost",
        );

        await HomeCtlr.instance.fetchTaxis();

        // Delay for message sending
        await Future.delayed(const Duration(seconds: 3));

        // Send WhatsApp message
        _sendWhatsAppMessage(item);
      }
    } catch (e) {
      log("Error in booking taxi: $e");
      Get.snackbar(
        "Booking Failed",
        "An error occurred while booking the taxi.",
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Helper Method to Send WhatsApp Message
  void _sendWhatsAppMessage(TaxiListModel item) async {
    const userPhone =
        '+919359292738'; // Replace with actual user phone if available
    final message =
        'Booking Details:\n\nTaxi Name: ${item.taxiName}\nDriver: ${item.taxiDriverName}\nPrice: ${item.pricePerKm} Per Km\nFrom: ${item.startLoc}\nTo: ${item.endLoc}';
    final url = 'https://wa.me/$userPhone?text=${Uri.encodeFull(message)}';

    try {
      await launchUrl(
        mode: LaunchMode.externalApplication,
        Uri.parse(url),
      );
    } catch (e) {
      log("$e");
      Get.snackbar(
        "Booking successfull!", // Title of the snackbar
        "Sriver will be arriving shortly.", // Message to be displayed
        snackPosition: SnackPosition.TOP,
        duration:
            const Duration(seconds: 3), // Duration to display the snackbar
      );
    }
  }
}
