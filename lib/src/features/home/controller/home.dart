import 'package:get/get.dart';

class HomeCtlr extends GetxController {
  //
  static HomeCtlr get instance => Get.find();

  var startLoc = ''.obs; // Start location entered by the user
  var endLoc = ''.obs; // End location entered by the user

  var taxis = <Map<String, dynamic>>[
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Goa Cab',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Panaji',
      'pricePerKm': 15.0,
      'startLoc': 'Panaji',
      'endLoc': 'Margao',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Beach Ride',
      'isAvailable': false,
      'taxiType': 'SUV',
      'location': 'Calangute',
      'pricePerKm': 20.0,
      'startLoc': 'Calangute',
      'endLoc': 'Candolim',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'City Ride',
      'isAvailable': true,
      'taxiType': 'Hatchback',
      'location': 'Vasco',
      'pricePerKm': 12.0,
      'startLoc': 'Vasco',
      'endLoc': 'Ponda',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Airport Express',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Dabolim Airport',
      'pricePerKm': 18.0,
      'startLoc': 'Dabolim Airport',
      'endLoc': 'Panaji',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Hilltop Shuttle',
      'isAvailable': false,
      'taxiType': 'Van',
      'location': 'Mapusa',
      'pricePerKm': 25.0,
      'startLoc': 'Mapusa',
      'endLoc': 'Anjuna',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'South Goa Ride',
      'isAvailable': true,
      'taxiType': 'SUV',
      'location': 'Margao',
      'pricePerKm': 22.0,
      'startLoc': 'Margao',
      'endLoc': 'Cavelossim',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Coastal Explorer',
      'isAvailable': true,
      'taxiType': 'Hatchback',
      'location': 'Arambol',
      'pricePerKm': 16.0,
      'startLoc': 'Arambol',
      'endLoc': 'Morjim',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Candolim Comfort',
      'isAvailable': false,
      'taxiType': 'Sedan',
      'location': 'Candolim',
      'pricePerKm': 17.5,
      'startLoc': 'Candolim',
      'endLoc': 'Baga',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Night Owl Cab',
      'isAvailable': true,
      'taxiType': 'SUV',
      'location': 'Panjim',
      'pricePerKm': 19.0,
      'startLoc': 'Panjim',
      'endLoc': 'Old Goa',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Sunset Taxi',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Palolem',
      'pricePerKm': 21.0,
      'startLoc': 'Palolem',
      'endLoc': 'Colva',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Adventure Ride',
      'isAvailable': false,
      'taxiType': 'Van',
      'location': 'Ponda',
      'pricePerKm': 23.0,
      'startLoc': 'Ponda',
      'endLoc': 'Dudhsagar Falls',
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Forest Trek Cab',
      'isAvailable': true,
      'taxiType': 'SUV',
      'location': 'Canacona',
      'pricePerKm': 25.0,
      'startLoc': 'Canacona',
      'endLoc': 'Agonda',
    },
  ].obs;

  // Update Start Location
  void updateStartLoc(String value) {
    startLoc.value = value;
  }

  // Update End Location
  void updateEndLoc(String value) {
    endLoc.value = value;
  }

  // Filter taxis based on start and end location
  List<Map<String, dynamic>> filterTaxis(List<Map<String, dynamic>> taxis) {
    return taxis.where((taxi) {
      final matchesStart =
          startLoc.value.isEmpty || taxi['startLoc'] == startLoc.value;
      final matchesEnd = endLoc.value.isEmpty || taxi['endLoc'] == endLoc.value;
      return matchesStart && matchesEnd;
    }).toList();
  }
}
