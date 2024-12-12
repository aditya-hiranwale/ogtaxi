import 'package:flutter/material.dart';
import 'package:ogtaxi/src/features/home/controller/home.dart';
import 'package:ogtaxi/src/features/home/model/location_model.dart';
import 'package:search_choices/search_choices.dart';

import '../../../../constants/sizes.dart';

class SearchTaxi extends StatefulWidget {
  final HomeCtlr ctlr;
  const SearchTaxi({
    super.key,
    required this.ctlr,
  });

  @override
  State<SearchTaxi> createState() => _SearchTaxiState();
}

class _SearchTaxiState extends State<SearchTaxi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Start location
        ListTile(
          title: SearchChoices.single(
            label: "Start location",
            fieldDecoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 3),
              ),
            ),
            padding: const EdgeInsets.all(KSizes.k8pad),
            displayClearIcon: false,
            items: widget.ctlr.locations
                .map((loc) => DropdownMenuItem<LocationModel>(
                      value: loc,
                      child: Text(loc.locName),
                    ))
                .toList(),
            value: widget.ctlr.startLoc,
            hint: const Text("Start location"),
            searchHint: "Search start location",
            onChanged: (value) => widget.ctlr.updateStartLoc(value),
            isExpanded: true,
            menuConstraints: BoxConstraints.tight(const Size.fromHeight(350)),
            dialogBox: false,
          ),
          trailing: IconButton(
            onPressed: () {
              // Show a message indicating voice input is not yet implemented
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Voice input not implemented')),
              );
            },
            icon: const Icon(Icons.mic),
          ),
        ),

        const Icon(
          Icons.arrow_downward_rounded,
          size: 24,
        ),

        // End location
        ListTile(
          title: SearchChoices.single(
            fieldDecoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 3),
              ),
            ),
            padding: const EdgeInsets.all(KSizes.k8pad),
            displayClearIcon: false,
            items: widget.ctlr.locations
                .map((loc) => DropdownMenuItem<LocationModel>(
                      value: loc,
                      child: Text(loc.locName),
                    ))
                .toList(),
            value: widget.ctlr.endLoc,
            hint: const Text("End location"),
            searchHint: "Search end location",
            onChanged: (value) => widget.ctlr.updateEndLoc(value),
            isExpanded: true,
            menuConstraints: BoxConstraints.tight(const Size.fromHeight(350)),
            dialogBox: false,
          ),
          trailing: IconButton(
            onPressed: () {
              // Show a message indicating voice input is not yet implemented
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Voice input not implemented')),
              );
            },
            icon: const Icon(Icons.mic),
          ),
        ),
      ],
    );
  }
}
