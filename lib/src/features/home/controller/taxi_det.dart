import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/taxi_type_model.dart';
import '../model/taxilist_model.dart';

class TaxiDetailCtlr extends GetxController {
  //
  //
  static TaxiDetailCtlr get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list of taxis
  final RxList<TaxiListModel> taxis = <TaxiListModel>[].obs;

  // Observable to store taxi types for mapping
  final RxMap<String, TaxiTypeModel> taxiTypesMap =
      <String, TaxiTypeModel>{}.obs;

  // Loading and error observables
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Fetch all taxis with their taxi type details
  Future<void> fetchTaxis() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Fetch taxi types first
      final QuerySnapshot taxiTypesSnapshot =
          await _firestore.collection('taxiTypes').get();

      if (taxiTypesSnapshot.docs.isEmpty) {
        // Handle empty taxi types collection
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

      // Fetch taxis
      final QuerySnapshot taxisSnapshot =
          await _firestore.collection('taxis').get();

      if (taxisSnapshot.docs.isEmpty) {
        // Handle empty taxis collection
        errorMessage.value = 'No taxis found.';
        taxis.clear();
      } else {
        // Parse taxi data and resolve taxiType references
        taxis.value = taxisSnapshot.docs.map((doc) {
          final taxiData = doc.data() as Map<String, dynamic>;
          final taxiTypeId = taxiData['taxiType'] ?? '';
          final TaxiTypeModel? taxiType = taxiTypesMap[taxiTypeId];

          return TaxiListModel.fromJson(
            {
              ...taxiData,
              'taxiType': taxiType?.type ?? 'Unknown',
              'basePricePerKm': taxiType?.basePricePerKm ?? 0.0,
            },
            doc.id,
          );
        }).toList();
      }
    } on FirebaseException catch (e) {
      // Firestore-specific exception
      errorMessage.value =
          'Error fetching taxis: ${e.message ?? 'Unknown error'}';
    } catch (e) {
      // Other general exceptions
      errorMessage.value = 'An unexpected error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Clear data if needed
  void clearData() {
    taxis.clear();
    taxiTypesMap.clear();
    errorMessage.value = '';
  }
}
