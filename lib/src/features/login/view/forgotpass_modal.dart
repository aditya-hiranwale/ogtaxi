import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/accrecovery/view/email_recovery_screen.dart';
import 'package:ogtaxi/src/features/accrecovery/view/phone_recovery_screen.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';
import '../../../../utils/theme/app_colors.dart';

class ForgotPassModal {
  //
  static Future<dynamic> forgotpassmodal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(KSizes.k8pad),
        child: Padding(
          padding: const EdgeInsets.all(KSizes.k8pad),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Text(
                KStrings.forgotPassTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                KStrings.forgotPassSubtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Esb.height(KSizes.k12pad),

              //
              Container(
                padding: const EdgeInsets.all(KSizes.k8pad),
                margin: const EdgeInsets.symmetric(vertical: KSizes.k8pad),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(KSizes.k14pad),
                  color: KColors.medianColor,
                ),
                child: ListTile(
                  onTap: () {
                    //
                    Navigator.of(context).pop();
                    Get.to(() => const EmailRecoveryScreen());
                  },
                  leading: const Icon(Icons.email),
                  title: Text(
                    "Via Email",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "Recover acc by email.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),

              //
              Container(
                padding: const EdgeInsets.all(KSizes.k8pad),
                margin: const EdgeInsets.symmetric(vertical: KSizes.k8pad),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(KSizes.k14pad),
                  color: KColors.medianColor,
                ),
                child: ListTile(
                  onTap: () {
                    //
                    Navigator.of(context).pop();
                    Get.to(() => const PhoneRecoveryScreen());
                  },
                  leading: const Icon(Icons.phone),
                  title: Text(
                    "Via Mobile",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "Recover acc by mobile.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
