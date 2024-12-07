import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/accrecovery/controller/otp.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/images.dart';
import '../../../../constants/kdevice_info.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(OtpCtlr());
    var otp;
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
              title: KStrings.otpSent,
              subtitle: "Please enter the otp below.",
            ),

            //
            OtpTextField(
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              fillColor: KColors.textDark,
              filled: true,
              onSubmit: (value) {
                log("OTP is -> $value");
                otp = value;
                ctlr.verifyOtp(otp);
              },
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //
                  // Get.to(const LoginScreen());
                  ctlr.verifyOtp(otp);
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
