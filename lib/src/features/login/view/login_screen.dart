import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/common_widgets/form/form_header_widget.dart';
import 'package:ogtaxi/src/features/home/view/home_screen.dart';
import 'package:ogtaxi/src/features/signup/view/signup_screen.dart';

import '../../../../constants/images.dart';
import '../../../../constants/kdevice_info.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';
import '../../../../utils/theme/app_colors.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = getThemeMode(context);
    return Scaffold(
      backgroundColor: isDark ? KColors.primeDark : KColors.primeLight,
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k14pad),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderWidget(
              image: KImages.logoLarge,
              title: KStrings.loginTitle,
              subtitle: KStrings.loginSubtitle,
            ),

            //form
            const LoginFormWidget(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("OR"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text("Login with google"),
                  ),
                ),
                Esb.height(KSizes.k14pad),
                TextButton(
                  onPressed: () {
                    //
                    Get.to(() => const SignupScreen());
                  },
                  child: Text.rich(
                    TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          //
                          TextSpan(text: KStrings.signup),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
