import 'package:flutter/material.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
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
    final isDark = getThemeMode(context);
    return Scaffold(
      backgroundColor: isDark ? KColors.primeDark : KColors.primeLight,
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k14pad),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeaderWidget(
                image: KImages.logoLarge,
                title: KStrings.signupTitle,
                subtitle: KStrings.signupSubtitle,
              ),

              //form
              const SignupFormWidget(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //
                    // Get.to(const LoginScreen());
                  },
                  child: Text(
                    KStrings.signup.toUpperCase(),
                    textAlign: TextAlign.center,
                    // style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),

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
                      icon: const Icon(Icons.login_rounded),
                      label: const Text("Signup with google"),
                    ),
                  ),
                  Esb.height(KSizes.k14pad),
                  TextButton(
                    onPressed: () {},
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
