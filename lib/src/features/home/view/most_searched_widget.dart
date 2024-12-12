import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';
import '../controller/home.dart';
import '../model/location_model.dart';

class MostSearchedWidget extends StatefulWidget {
  final HomeCtlr ctlr;

  const MostSearchedWidget({
    super.key,
    required this.ctlr,
  });

  @override
  State<MostSearchedWidget> createState() => _MostSearchedWidgetState();
}

class _MostSearchedWidgetState extends State<MostSearchedWidget> {
  late final List<Map<String, LocationModel>> items;

  @override
  void initState() {
    super.initState();

    // Shuffle the locations and prepare unique pairs only once
    final List<LocationModel> shuffledLocations =
        List<LocationModel>.from(widget.ctlr.locations)..shuffle();

    final int maxItems = min(
        4, shuffledLocations.length ~/ 2); // Max items based on unique pairs

    items = List.generate(maxItems, (index) {
      final title = shuffledLocations.removeLast();
      final subtitle = shuffledLocations.removeLast();
      return {'title': title, 'subtitle': subtitle};
    });
  }

  @override
  Widget build(BuildContext context) {
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
            widget.ctlr.selectedIndex.value =
                widget.ctlr.selectedIndex.value == index ? -1 : index;

            if (widget.ctlr.selectedIndex.value == -1) {
              widget.ctlr.resetTaxiList();
            } else {
              widget.ctlr.updateStartLoc(item['subtitle']!.locName);
              widget.ctlr.updateEndLoc(item['title']!.locName);
            }
          },
          child: Obx(() {
            final bool isSelected = widget.ctlr.selectedIndex.value == index;

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
                        item['title']?.locName ?? 'Unknown Location',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      // Subtitle
                      Text(
                        item['subtitle']?.locName ?? 'Unknown Location',
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
