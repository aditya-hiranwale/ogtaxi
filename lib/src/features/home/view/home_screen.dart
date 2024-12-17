import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/constants/sizes.dart';
import 'package:ogtaxi/constants/strings.dart';
import 'package:ogtaxi/extensions/esizedbox.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';
import 'package:ogtaxi/src/features/home/controller/home.dart';
import 'package:ogtaxi/src/features/home/model/taxilist_model.dart';
import 'package:ogtaxi/src/features/home/view/most_searched_widget.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

import 'search_taxi_widget.dart';
import 'taxi_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(HomeCtlr());

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
            radius: 24,
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
        padding: const EdgeInsets.all(KSizes.k8pad),
        child: Obx(
          () {
            final isLoading = ctlr.isLoading.value;
            final filteredTaxis = ctlr.filterTaxis(ctlr.taxis);
            log("Taxi list: ${ctlr.taxis.length}");

            if (isLoading) {
              return const Center(
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }

            return ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildHeaderSection(context),
                Esb.height(KSizes.k16pad),
                _buildMostSearchedSection(ctlr),
                Esb.height(KSizes.k8pad),
                SearchTaxi(ctlr: ctlr),
                Esb.height(KSizes.k8pad),
                _buildTaxiListSection(filteredTaxis),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTaxiListSection(List<TaxiListModel> filteredTaxis) {
    if (filteredTaxis.isEmpty) {
      return const Center(
        child: Text('No results found.'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredTaxis.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final taxi = filteredTaxis[index];
        return TaxiCard(item: taxi);
      },
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Esb.height(KSizes.k18pad),
        Text("Hi, John.", style: txtTheme.headlineMedium),
        Esb.height(KSizes.k4pad),
        Text("Enter locations to see taxis", style: txtTheme.bodyLarge),
      ],
    );
  }

  Widget _buildMostSearchedSection(HomeCtlr ctlr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Searched", style: Get.textTheme.bodyMedium),
        Esb.height(KSizes.k4pad),
        SizedBox(
          height: 64,
          child: MostSearchedWidget(ctlr: ctlr),
        ),
      ],
    );
  }
}
