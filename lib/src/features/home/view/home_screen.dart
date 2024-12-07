import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/constants/sizes.dart';
import 'package:ogtaxi/constants/strings.dart';
import 'package:ogtaxi/extensions/esizedbox.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

import '../../signup/controller/signup.dart';
import 'search_taxi_widget.dart';
import 'taxi_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> taxis = [
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Goa Cab',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Panaji',
      'pricePerKm': 15.0,
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Beach Ride',
      'isAvailable': false,
      'taxiType': 'SUV',
      'location': 'Calangute',
      'pricePerKm': 20.0,
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Goa Cab',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Panaji',
      'pricePerKm': 15.0,
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Beach Ride',
      'isAvailable': false,
      'taxiType': 'SUV',
      'location': 'Calangute',
      'pricePerKm': 20.0,
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Goa Cab',
      'isAvailable': true,
      'taxiType': 'Sedan',
      'location': 'Panaji',
      'pricePerKm': 15.0,
    },
    {
      'imageUrl': 'https://via.placeholder.com/80',
      'taxiName': 'Beach Ride',
      'isAvailable': false,
      'taxiType': 'SUV',
      'location': 'Calangute',
      'pricePerKm': 20.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: Text(
          KStrings.appName,
          style: txtTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 44,
            backgroundColor: KColors.medianColor,
            // foregroundImage: AssetImage(KImages.logoSmall),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: KColors.textDark,
              ),
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      // Cancel button
                      TextButton(
                        onPressed: () {
                          Get.back(); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      // Logout button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          AuthRepo.instance.logout();
                          // Get.back(); // Close the dialog
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k14pad),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Esb.height(KSizes.k18pad),
              //
              Text(
                "Hi, John.",
                style: txtTheme.headlineMedium,
              ),
              Esb.height(KSizes.k4pad),
              Text(
                "Enter locations to see taxis",
                style: txtTheme.headlineSmall,
              ),

              //locations card
              // const Spacer(),
              Esb.height(KSizes.k16pad),
              const SearchTaxi(),

              //search results
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: taxis.length,
                itemBuilder: (context, index) {
                  final taxi = taxis[index];
                  return TaxiCard(
                    imageUrl: taxi['imageUrl'],
                    taxiName: taxi['taxiName'],
                    isAvailable: taxi['isAvailable'],
                    taxiType: taxi['taxiType'],
                    location: taxi['location'],
                    pricePerKm: taxi['pricePerKm'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
