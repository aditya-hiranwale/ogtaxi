import 'package:flutter/material.dart';

import '../../constants/kdevice_info.dart';
import '../../constants/sizes.dart';
import '../../extensions/esizedbox.dart';

class FormHeaderWidget extends StatelessWidget {
  final String image, title, subtitle;
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          // width: getDeviceWidth(context) / 1.1,
          height: getDeviceHeight(context) / 4,
          alignment: Alignment.center,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Esb.height(KSizes.k16pad),
      ],
    );
  }
}
