import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class SearchTaxi extends StatelessWidget {
  const SearchTaxi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //start loc
        Container(
          padding: const EdgeInsets.all(KSizes.k4pad),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 4),
            ),
          ),
          child: ListTile(
            title: const Text("Start location"),
            trailing: IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.mic),
            ),
          ),
        ),

        //
        const Icon(
          Icons.arrow_downward_rounded,
          size: 44,
        ),

        //end loc
        Container(
          padding: const EdgeInsets.all(KSizes.k4pad),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 4),
            ),
          ),
          child: ListTile(
            title: const Text("End location"),
            trailing: IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.mic),
            ),
          ),
        ),
      ],
    );
  }
}
