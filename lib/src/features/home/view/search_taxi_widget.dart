import 'package:flutter/material.dart';
import 'package:ogtaxi/src/features/home/controller/home.dart';
import 'package:search_choices/search_choices.dart';

import '../../../../constants/sizes.dart';

class SearchTaxi extends StatefulWidget {
  const SearchTaxi({super.key});

  @override
  State<SearchTaxi> createState() => _SearchTaxiState();
}

class _SearchTaxiState extends State<SearchTaxi> {
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

  // Selected start and end locations
  String? selectedStartLocation;
  String? selectedEndLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Start location
        Container(
          padding: const EdgeInsets.all(KSizes.k4pad),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 4),
            ),
          ),
          child: ListTile(
            title: SearchChoices.single(
              items: locations
                  .map((loc) => DropdownMenuItem<String>(
                        value: loc,
                        child: Text(loc),
                      ))
                  .toList(),
              value: selectedStartLocation,
              hint: const Text("Start location"),
              searchHint: "Search start location",
              onChanged: (value) => HomeCtlr.instance.updateStartLoc(value),
              isExpanded: true,
              menuConstraints: BoxConstraints.tight(const Size.fromHeight(350)),
              dialogBox: false,
            ),
            trailing: IconButton(
              onPressed: () {
                // Implement voice input if needed
              },
              icon: const Icon(Icons.mic),
            ),
          ),
        ),

        const Icon(
          Icons.arrow_downward_rounded,
          size: 44,
        ),

        // End location
        Container(
          padding: const EdgeInsets.all(KSizes.k4pad),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 4),
            ),
          ),
          child: ListTile(
            title: SearchChoices.single(
              items: locations
                  .map((loc) => DropdownMenuItem<String>(
                        value: loc,
                        child: Text(loc),
                      ))
                  .toList(),
              value: selectedEndLocation,
              hint: const Text("End location"),
              searchHint: "Search end location",
              onChanged: (value) => HomeCtlr.instance.updateEndLoc(value),
              isExpanded: true,
              menuConstraints: BoxConstraints.tight(const Size.fromHeight(350)),
              dialogBox: false,
            ),
            trailing: IconButton(
              onPressed: () {
                // Implement voice input if needed
              },
              icon: const Icon(Icons.mic),
            ),
          ),
        ),
      ],
    );
  }
}
