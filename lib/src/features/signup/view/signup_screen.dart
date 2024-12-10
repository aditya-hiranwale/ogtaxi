import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/login/view/login_screen.dart';
import 'package:ogtaxi/src/features/signup/controller/signup.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../common_widgets/form/loading_widget.dart';
import '../../../../constants/images.dart';
import '../../../../constants/kdevice_info.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';
import '../../../../utils/theme/app_colors.dart';
import 'signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(SignupCtlr());
    final isDark = getThemeMode(context);
    return Scaffold(
      backgroundColor: isDark ? KColors.primeDark : KColors.primeLight,
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k14pad),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FormHeaderWidget(
                image: KImages.logoLarge,
                title: KStrings.signupTitle,
                subtitle: KStrings.signupSubtitle,
              ),

              //form
              SignupFormWidget(
                ctlr: ctlr,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("OR"),
                  ),
                  ctlr.isloading.value
                      ? const LoadingButton()
                      : SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              //
                              // ctlr.registerUser("email", "pass");
                            },
                            icon: const Icon(Icons.login_rounded),
                            label: const Text("Signup with google"),
                          ),
                        ),
                  Esb.height(KSizes.k14pad),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Already have an account? ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                            //
                            TextSpan(text: KStrings.login),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
