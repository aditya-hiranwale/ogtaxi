import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/common_widgets/form/form_header_widget.dart';
import 'package:ogtaxi/constants/images.dart';
import 'package:ogtaxi/constants/sizes.dart';
import 'package:ogtaxi/constants/strings.dart';
import 'package:ogtaxi/extensions/esizedbox.dart';

import '../../../../constants/kdevice_info.dart';
import 'otp_verify_screen.dart';

class PhoneRecoveryScreen extends StatelessWidget {
  const PhoneRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(KSizes.k16pad),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Esb.height(KSizes.k14pad * 2),

            FormHeaderWidget(
              image: KImages.forgotPass,
              imgHeight: getDeviceHeight(context) / 2,
              title: '${KStrings.forgotPass}?',
              subtitle: KStrings.recoverAcc,
            ),

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: KStrings.mobile,
                hintText: KStrings.mobile,
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //
                  Get.to(() => const OTPScreen());
                },
                child: Text(
                  KStrings.submit.toUpperCase(),
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
