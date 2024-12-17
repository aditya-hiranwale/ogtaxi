import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/location_model.dart';
import '../model/taxi_type_model.dart';
import '../model/taxilist_model.dart';

class HomeCtlr extends GetxController {
  //
  static HomeCtlr get instance => Get.find();

  var startLoc = ''.obs; // Start location entered by the user
  var endLoc = ''.obs; // End location entered by the user
  var selectedIndex = RxInt(-1); // Default to no selection (index -1)

  @override
  void onInit() async {
    super.onInit();
    log("Executing init");
    await fetchLocations();
    await fetchTaxis();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list of locations
  final RxList<LocationModel> locations = <LocationModel>[].obs;

  // Observable list of taxis
  final RxList<TaxiListModel> taxis = <TaxiListModel>[].obs;

  // Observable to store taxi types for mapping
  final RxMap<String, TaxiTypeModel> taxiTypesMap =
      <String, TaxiTypeModel>{}.obs;

  // Filter taxis based on start and end location
  List<TaxiListModel> filterTaxis(List<TaxiListModel> taxis) {
    // If either startLoc or endLoc is empty, return all taxis
    if (startLoc.value.isEmpty || endLoc.value.isEmpty) {
      return taxis;
    }

    // Otherwise, filter taxis based on both startLoc and endLoc
    return taxis.where((taxi) {
      final matchesStart = taxi.startLoc.toLowerCase().trim() ==
          startLoc.value.toLowerCase().trim();
      final matchesEnd =
          taxi.endLoc.toLowerCase().trim() == endLoc.value.toLowerCase().trim();
      return matchesStart && matchesEnd;
    }).toList();
  }

  // Observable to track loading state
  final RxBool isLoading = false.obs;

  // Observable for error message
  final RxString errorMessage = ''.obs;

  /// Fetch all locations from Firestore
  Future<void> fetchLocations() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('locations').get();

      if (snapshot.docs.isEmpty) {
        // Handle empty collection
        locations.clear();
        errorMessage.value = 'No locations found.';
      } else {
        // Parse data into models
        locations.value = snapshot.docs
            .map((doc) => LocationModel.fromJson(
                doc.data() as Map<String, dynamic>, doc.id))
            .toList();
      }
    } on FirebaseException catch (e) {
      // Firestore-specific exceptions
      errorMessage.value =
          'Error fetching locations: ${e.message ?? 'Unknown error'}';
    } catch (e) {
      // Other general exceptions
      errorMessage.value = 'An unexpected error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTaxis() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Fetch taxi types
      final QuerySnapshot taxiTypesSnapshot =
          await _firestore.collection('taxiTypes').get();

      if (taxiTypesSnapshot.docs.isEmpty) {
        log('No taxi types found.');
        errorMessage.value = 'No taxi types found.';
        taxis.clear();
        return;
      }

      // Map taxi types by their IDs
      taxiTypesMap.value = {
        for (var doc in taxiTypesSnapshot.docs)
          doc.id:
              TaxiTypeModel.fromJson(doc.data() as Map<String, dynamic>, doc.id)
      };
      log('Fetched taxiTypesMap: ${taxiTypesMap.toString()}');

      // Fetch taxis
      final QuerySnapshot taxisSnapshot =
          await _firestore.collection('taxiList').get();

      if (taxisSnapshot.docs.isEmpty) {
        log('snapshot empty, No taxis found.');
        errorMessage.value = 'No taxis found.';
        taxis.clear();
      } else {
        log('Fetched taxis count: ${taxisSnapshot.docs.length}');
        taxis.value = await Future.wait(taxisSnapshot.docs.map((doc) async {
          final taxiData = doc.data() as Map<String, dynamic>;
          log('Processing taxi data: $taxiData');

          // Resolve taxiType reference
          String? taxiTypeName;
          double? basePricePerKm;
          if (taxiData['taxiType'] is DocumentReference) {
            final taxiTypeRef = taxiData['taxiType'] as DocumentReference;
            final taxiTypeDoc = await taxiTypeRef.get();
            if (taxiTypeDoc.exists) {
              final taxiTypeData = TaxiTypeModel.fromJson(
                  taxiTypeDoc.data() as Map<String, dynamic>, taxiTypeDoc.id);
              taxiTypeName = taxiTypeData.type;
              basePricePerKm = taxiTypeData.basePricePerKm;
            }
          }

          // Resolve startLoc reference
          String? startLocName;
          if (taxiData['startLoc'] is DocumentReference) {
            final startLocRef = taxiData['startLoc'] as DocumentReference;
            final cachedLocation = locations.firstWhereOrNull((loc) =>
                loc.locationId == startLocRef.id); // Check in cached locations
            if (cachedLocation != null) {
              startLocName = cachedLocation.locName;
            } else {
              final startLocDoc =
                  await startLocRef.get(); // Fetch from Firestore
              if (startLocDoc.exists) {
                final locationData = LocationModel.fromJson(
                    startLocDoc.data() as Map<String, dynamic>, startLocDoc.id);
                startLocName = locationData.locName;
              }
            }
          }

          // Resolve endLoc reference
          String? endLocName;
          if (taxiData['endLoc'] is DocumentReference) {
            final endLocRef = taxiData['endLoc'] as DocumentReference;
            final cachedLocation = locations.firstWhereOrNull((loc) =>
                loc.locationId == endLocRef.id); // Check in cached locations
            if (cachedLocation != null) {
              endLocName = cachedLocation.locName;
            } else {
              final endLocDoc = await endLocRef.get(); // Fetch from Firestore
              if (endLocDoc.exists) {
                final locationData = LocationModel.fromJson(
                    endLocDoc.data() as Map<String, dynamic>, endLocDoc.id);
                endLocName = locationData.locName;
              }
            }
          }

          return TaxiListModel.fromJson(
            {
              ...taxiData,
              'taxiType': taxiTypeName ?? 'Unknown',
              'basePricePerKm': basePricePerKm ?? 0.0,
              'startLoc': startLocName ?? 'Unknown',
              'endLoc': endLocName ?? 'Unknown',
            },
            doc.id,
          );
        }).toList());
        log('Parsed taxis: ${taxis.toString()}');
      }
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
      errorMessage.value =
          'Error fetching taxis: ${e.message ?? 'Unknown error'}';
    } catch (e) {
      log('General Exception: $e');
      errorMessage.value = 'An unexpected error occurred: $e';
    } finally {
      isLoading.value = false;
      log('Fetching taxis complete. isLoading: ${isLoading.value}');
    }
  }

  /// Clear the data (if needed)
  void clearDataInHomeCtlr() {
    locations.clear();
    errorMessage.value = '';
    taxis.clear();
    taxiTypesMap.clear();
  }

  void updateStartLoc(String? value) {
    if (value != null) {
      startLoc.value = value;
      update();
    }
  }

  void updateEndLoc(String? value) {
    if (value != null) {
      endLoc.value = value;
      update();
    }
  }

  // Reset taxi list
  void resetTaxiList() {
    // Clear the filter if the location is deselected
    startLoc.value = '';
    endLoc.value = '';
  }
}
