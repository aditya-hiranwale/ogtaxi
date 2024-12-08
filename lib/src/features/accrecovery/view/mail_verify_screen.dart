import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/accrecovery/controller/email_verify.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/images.dart';
import '../../../../constants/kdevice_info.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(EmailVerifyCtlr());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k16pad),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Esb.height(KSizes.k14pad * 2),

            FormHeaderWidget(
              image: KImages.verifyOTP,
              imgHeight: getDeviceHeight(context) / 2,
              title: "Email verification link sent to your email",
              subtitle:
                  "After clicking on the link in email press continue button below",
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //
                  // Get.to(const LoginScreen());
                  ctlr.checkIfEmailVerified();
                },
                child: const Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
