import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:ogtaxi/utils/theme/app_colors.dart';

import '../controller/home.dart';

class MostSearchedWidget extends StatelessWidget {
  final HomeCtlr ctlr;
  const MostSearchedWidget({
    super.key,
    required this.ctlr,
  });

  @override
  Widget build(BuildContext context) {
    // Shuffle the locations to get a random order
    List<String> shuffledLocations = List<String>.from(ctlr.locations)
      ..shuffle();

    // Ensure no duplicates for title and subtitle
    final int maxItems = min(
        4, shuffledLocations.length ~/ 2); // Max items based on unique pairs
    final List<Map<String, String>> items = List.generate(maxItems, (index) {
      final title = shuffledLocations.removeLast();
      final subtitle = shuffledLocations.removeLast();
      return {'title': title, 'subtitle': subtitle};
    });

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return GestureDetector(
          onTap: () {
            // Toggle the selected index
            ctlr.selectedIndex.value = ctlr.selectedIndex.value == index
                ? -1
                : index; // Set to -1 if deselecting
            if (ctlr.selectedIndex == -1) {
              ctlr.resetTaxiList();
            } else {
              ctlr.updateStartLoc(item['subtitle'].toString());
              ctlr.updateEndLoc(item['title'].toString());
            }
          },
          child: Obx(() {
            final bool isSelected = ctlr.selectedIndex.value == index;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: isSelected
                    ? Border.all(color: KColors.primeDark, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  // Icon or Image
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: KColors.primeDark,
                      borderRadius: BorderRadius.circular(8.0),
                      border: isSelected
                          ? Border.all(color: KColors.primeLight, width: 2)
                          : null,
                    ),
                    child: const Icon(
                      Icons.switch_access_shortcut,
                      size: 28,
                      color: KColors.primeLight,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        item['title'] ?? 'Unknown Location',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      // Subtitle
                      Text(
                        item['subtitle'] ?? 'Unknown Location',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
