import 'package:get/get.dart';

class HomeCtlr extends GetxController {
  //
  static HomeCtlr get instance => Get.find();

  var startLoc = ''.obs; // Start location entered by the user
  var endLoc = ''.obs; // End location entered by the user
  var selectedIndex = RxInt(-1); // Default to no selection (index -1)

  // List of locations
  final List<String> locations = [
    "Panaji",
    "Margao",
    "Vasco",
    "Ponda",
    "Calangute",
    "Mapusa",
    "Candolim",
    "Colva",
    "Panjim",
    "Old Goa"
  ];

  // Update Start Location
  void updateStartLoc(String value) {
    startLoc.value = value;
  }

  // Update End Location
  void updateEndLoc(String value) {
    endLoc.value = value;
  }

  // Reset taxi list
  void resetTaxiList() {
    // Clear the filter if the location is deselected
    startLoc.value = '';
    endLoc.value = '';
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

  final List<Map<String, dynamic>> taxis = [
    {
      'id': 1,
      'taxiName': 'Goa Cab',
      'taxiDriverName': 'Rohan Naik',
      'rating': 4.5,
      'taxiType': 'SUV',
      'startLoc': 'Panaji',
      'endLoc': 'Margao',
      'pricePerKm': 15.0,
      'isAvailable': true,
    },
    {
      'id': 2,
      'taxiName': 'Beach Ride',
      'taxiDriverName': 'Amit Desai',
      'rating': 4.2,
      'taxiType': 'Sedan',
      'startLoc': 'Calangute',
      'endLoc': 'Candolim',
      'pricePerKm': 20.0,
      'isAvailable': false,
    },
    {
      'id': 3,
      'taxiName': 'City Ride',
      'taxiDriverName': 'Siddharth Patil',
      'rating': 4.0,
      'taxiType': 'Hatchback',
      'startLoc': 'Vasco',
      'endLoc': 'Ponda',
      'pricePerKm': 12.0,
      'isAvailable': true,
    },
    {
      'id': 4,
      'taxiName': 'Airport Express',
      'taxiDriverName': 'Rajesh Kamat',
      'rating': 4.8,
      'taxiType': 'Sedan',
      'startLoc': 'Dabolim Airport',
      'endLoc': 'Panaji',
      'pricePerKm': 18.0,
      'isAvailable': true,
    },
    {
      'id': 5,
      'taxiName': 'Hilltop Shuttle',
      'taxiDriverName': 'Swapnil Sawant',
      'rating': 4.5,
      'taxiType': 'Van',
      'startLoc': 'Mapusa',
      'endLoc': 'Anjuna',
      'pricePerKm': 25.0,
      'isAvailable': false,
    },
    {
      'id': 6,
      'taxiName': 'South Goa Ride',
      'taxiDriverName': 'Ganesh Parab',
      'rating': 4.2,
      'taxiType': 'SUV',
      'startLoc': 'Margao',
      'endLoc': 'Cavelossim',
      'pricePerKm': 22.0,
      'isAvailable': true,
    },
    {
      'id': 7,
      'taxiName': 'Coastal Explorer',
      'taxiDriverName': 'John D\'Souza',
      'rating': 4.3,
      'taxiType': 'Hatchback',
      'startLoc': 'Arambol',
      'endLoc': 'Morjim',
      'pricePerKm': 16.0,
      'isAvailable': true,
    },
    {
      'id': 8,
      'taxiName': 'Candolim Comfort',
      'taxiDriverName': 'Alisha Rodrigues',
      'rating': 4.1,
      'taxiType': 'Sedan',
      'startLoc': 'Candolim',
      'endLoc': 'Baga',
      'pricePerKm': 17.5,
      'isAvailable': false,
    },
    {
      'id': 9,
      'taxiName': 'Night Owl Cab',
      'taxiDriverName': 'Nandini Gaunekar',
      'rating': 4.6,
      'taxiType': 'SUV',
      'startLoc': 'Panjim',
      'endLoc': 'Old Goa',
      'pricePerKm': 19.0,
      'isAvailable': true,
    },
    {
      'id': 10,
      'taxiName': 'Sunset Taxi',
      'taxiDriverName': 'Vivek Chari',
      'rating': 4.4,
      'taxiType': 'Sedan',
      'startLoc': 'Palolem',
      'endLoc': 'Colva',
      'pricePerKm': 21.0,
      'isAvailable': true,
    },
    {
      'id': 11,
      'taxiName': 'Adventure Ride',
      'taxiDriverName': 'Ravi Dhuri',
      'rating': 4.2,
      'taxiType': 'Van',
      'startLoc': 'Ponda',
      'endLoc': 'Dudhsagar Falls',
      'pricePerKm': 23.0,
      'isAvailable': false,
    },
    {
      'id': 12,
      'taxiName': 'Forest Trek Cab',
      'taxiDriverName': 'Amit Desai',
      'rating': 4.7,
      'taxiType': 'SUV',
      'startLoc': 'Canacona',
      'endLoc': 'Agonda',
      'pricePerKm': 25.0,
      'isAvailable': true,
    },
    {
      'id': 13,
      'taxiName': 'Express Lane',
      'taxiDriverName': 'Meera Naik',
      'rating': 4.5,
      'taxiType': 'Sedan',
      'startLoc': 'Calangute',
      'endLoc': 'Vasco',
      'pricePerKm': 18.0,
      'isAvailable': true,
    },
    {
      'id': 14,
      'taxiName': 'Swift Cab',
      'taxiDriverName': 'Ganesh Parab',
      'rating': 4.3,
      'taxiType': 'Hatchback',
      'startLoc': 'Candolim',
      'endLoc': 'Margao',
      'pricePerKm': 20.0,
      'isAvailable': true,
    },
    {
      'id': 15,
      'taxiName': 'Eco Ride',
      'taxiDriverName': 'Anand Patil',
      'rating': 4.2,
      'taxiType': 'SUV',
      'startLoc': 'Arambol',
      'endLoc': 'Panjim',
      'pricePerKm': 22.0,
      'isAvailable': true,
    },
    {
      'id': 16,
      'taxiName': 'Riverfront Cab',
      'taxiDriverName': 'Prakash Kamat',
      'rating': 4.8,
      'taxiType': 'Sedan',
      'startLoc': 'Mapusa',
      'endLoc': 'Old Goa',
      'pricePerKm': 24.0,
      'isAvailable': true,
    },
    {
      'id': 17,
      'taxiName': 'Mountain Shuttle',
      'taxiDriverName': 'Yashwant Sawant',
      'rating': 4.6,
      'taxiType': 'Van',
      'startLoc': 'Dabolim Airport',
      'endLoc': 'Candolim',
      'pricePerKm': 30.0,
      'isAvailable': false,
    },
    {
      'id': 18,
      'taxiName': 'Golden Ride',
      'taxiDriverName': 'Krishna Faleiro',
      'rating': 4.4,
      'taxiType': 'Hatchback',
      'startLoc': 'Margao',
      'endLoc': 'Baga',
      'pricePerKm': 18.0,
      'isAvailable': true,
    },
    {
      'id': 19,
      'taxiName': 'Seaside Taxi',
      'taxiDriverName': 'Rahul Borkar',
      'rating': 4.7,
      'taxiType': 'SUV',
      'startLoc': 'Colva',
      'endLoc': 'Anjuna',
      'pricePerKm': 21.0,
      'isAvailable': true,
    },
    {
      'id': 20,
      'taxiName': 'Heritage Cab',
      'taxiDriverName': 'Alok Rane',
      'rating': 4.5,
      'taxiType': 'Sedan',
      'startLoc': 'Panjim',
      'endLoc': 'Dudhsagar Falls',
      'pricePerKm': 28.0,
      'isAvailable': true,
    },
    {
      'id': 21,
      'taxiName': 'Lagoon Shuttle',
      'taxiDriverName': 'Sonia Naik',
      'rating': 4.6,
      'taxiType': 'SUV',
      'startLoc': 'Morjim',
      'endLoc': 'Palolem',
      'pricePerKm': 26.0,
      'isAvailable': false,
    },
    {
      'id': 22,
      'taxiName': 'Adventure Taxi',
      'taxiDriverName': 'Vaibhav Gaonkar',
      'rating': 4.3,
      'taxiType': 'Van',
      'startLoc': 'Canacona',
      'endLoc': 'Mapusa',
      'pricePerKm': 22.0,
      'isAvailable': true,
    },
    {
      'id': 23,
      'taxiName': 'Urban Explorer',
      'taxiDriverName': 'Nikita Keni',
      'rating': 4.5,
      'taxiType': 'Hatchback',
      'startLoc': 'Old Goa',
      'endLoc': 'Candolim',
      'pricePerKm': 19.0,
      'isAvailable': true,
    },
    {
      'id': 24,
      'taxiName': 'Western Cab',
      'taxiDriverName': 'Samarth Gaonkar',
      'rating': 4.7,
      'taxiType': 'Sedan',
      'startLoc': 'Ponda',
      'endLoc': 'Colva',
      'pricePerKm': 20.0,
      'isAvailable': true,
    },
    {
      'id': 25,
      'taxiName': 'Paradise Ride',
      'taxiDriverName': 'Divya Naik',
      'rating': 4.2,
      'taxiType': 'SUV',
      'startLoc': 'Baga',
      'endLoc': 'Calangute',
      'pricePerKm': 16.0,
      'isAvailable': true,
    },
  ];
}
