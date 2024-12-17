import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/common_widgets/form/loading_widget.dart';
import 'package:ogtaxi/constants/kdevice_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/theme/app_colors.dart';
import '../controller/taxi_det.dart';
import '../model/taxilist_model.dart';

class TaxiDetailScreen extends StatelessWidget {
  final TaxiListModel item;

  const TaxiDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final TaxiDetailCtlr ctlr = Get.put(TaxiDetailCtlr());

    var txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: KColors.primeDark),
        backgroundColor: Colors.white,
        title: Text(item.taxiName, style: txtTheme.bodyLarge),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Carousel
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: item.images.length,
                  options: CarouselOptions(
                    height: 350,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    pageSnapping: true,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      ctlr.updateActiveIndex(index);
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final url = item.images[index];
                    return _buildImg(url, context);
                  },
                ),
                const SizedBox(height: 8),

                // Indicator
                Obx(() => AnimatedSmoothIndicator(
                      activeIndex: ctlr.activeIndex.value,
                      count: item.images.length,
                      effect: const WormEffect(
                        activeDotColor: KColors.primeDark,
                        dotColor: KColors.primeLight,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    )),
              ],
            ),

            const SizedBox(height: 16),

            // Taxi Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Taxi Availability Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Availability", style: txtTheme.titleMedium),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: item.isAvailable ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item.isAvailable ? "Available" : "Unavailable",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                  _buildDetailRow(
                    "Taxi Name",
                    item.taxiName,
                    txtTheme,
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                  _buildDetailRow(
                    "Taxi Type",
                    "${item.taxiType} Taxi",
                    txtTheme,
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                  _buildDetailRow(
                    "Cost",
                    "${item.pricePerKm} Per Km",
                    txtTheme,
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                  _buildDetailRow(
                    "Available at:",
                    item.startLoc,
                    txtTheme,
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                  _buildDetailRow(
                    "Driver Name:",
                    item.taxiDriverName,
                    txtTheme,
                  ),
                  const Divider(
                    color: KColors.primeLight,
                    // height: 1,
                    thickness: 1,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Call Driver Button with URL Launcher
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                width: getDeviceWidth(context),
                child: OutlinedButton.icon(
                  onPressed: () => _launchPhoneCall(item.taxiDriverName),
                  icon: const Icon(Icons.call),
                  label: const Text("Call Driver"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Booking Button
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ctlr.isLoading.value
                    ? const LoadingButton()
                    : SizedBox(
                        width: getDeviceWidth(context),
                        child: ElevatedButton(
                          onPressed: item.isAvailable
                              ? () async {
                                  await ctlr.bookTaxi(item, 50.00);
                                }
                              : null,
                          child: const Text(
                            "Book Now",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper Method to Launch Phone Call
  void _launchPhoneCall(String driverName) async {
    final phone = Uri(
      scheme: 'tel',
      path: "9359292738",
    );
    try {
      await launchUrl(phone);
    } catch (e) {
      log("$e");
      Get.snackbar(
        "Error occured", // Title of the snackbar
        "Phone dialer did'nt resposnd", // Message to be displayed
        snackPosition: SnackPosition.TOP,
        duration:
            const Duration(seconds: 3), // Duration to display the snackbar
      );
    }
  }

// Helper Method to Build Detail Rows with Alternating Backgrounds
  Widget _buildDetailRow(
    String label,
    String value,
    TextTheme txtTheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: txtTheme.titleMedium,
        ),
        Text(
          value,
          style: txtTheme.bodyMedium,
        ),
      ],
    );
  }

  // Build image widget
  Widget _buildImg(String url, BuildContext context) => Container(
        width: getDeviceWidth(context),
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: KColors.primeDark,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error, color: Colors.red),
            ),
            progressIndicatorBuilder: (context, url, progress) => const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: KColors.primeLight,
              ),
            ),
          ),
        ),
      );
}
