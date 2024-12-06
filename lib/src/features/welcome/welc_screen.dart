import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/constants/images.dart';
import 'package:ogtaxi/constants/sizes.dart';
import 'package:ogtaxi/constants/strings.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

import '../../../constants/kdevice_info.dart';
import '../../../extensions/esizedbox.dart';
import '../login/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = getThemeMode(context);
    return Scaffold(
      backgroundColor: isDark ? KColors.primeDark : KColors.primeLight,
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k14pad),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //
            // Esb.height(
            //   getDeviceHeight(context) / 4,
            // ),
            Image(
              image: const AssetImage(KImages.logoLarge),
              width: getDeviceWidth(context) / 1.1,
              height: getDeviceHeight(context) / 2,
            ),
            // Esb.height(
            //   44,
            // ),
            Column(
              children: [
                Text(
                  KStrings.welcTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  KStrings.welcSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // const Spacer(),

            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      KStrings.signup,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Esb.width(8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      KStrings.login,
                      textAlign: TextAlign.center,
                      // style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
              ],
            ),
            // Esb.height(44),
          ],
        ),
      ),
    );
  }
}
