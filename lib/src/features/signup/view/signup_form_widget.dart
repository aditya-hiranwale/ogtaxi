import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/accrecovery/view/otp_verify_screen.dart';
import 'package:ogtaxi/src/features/signup/controller/signup.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(SignupCtlr());
    final formkey = GlobalKey<FormState>();
    ctlr.phoneCtlr.text = "+91";
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            //
            TextFormField(
              controller: ctlr.fullNameCtlr,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.perm_identity_rounded),
                labelText: KStrings.fullName,
                hintText: KStrings.fullName,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              controller: ctlr.emailCtlr,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: KStrings.email,
                hintText: KStrings.email,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              controller: ctlr.phoneCtlr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: KStrings.mobile,
                hintText: KStrings.mobile,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              controller: ctlr.passCtlr,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: KStrings.pass,
                hintText: KStrings.pass,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              controller: ctlr.confirmPassCtlr,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: KStrings.passConfirm,
                hintText: KStrings.passConfirm,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            Esb.height(KSizes.k14pad),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //
                  if (formkey.currentState!.validate()) {
                    //
                    // ctlr.registerUser(ctlr.emailCtlr.text.trim(),
                    //     ctlr.confirmPassCtlr.text.trim());

                    ctlr.userPhoneAuth(ctlr.phoneCtlr.text.trim());
                    Get.to(() => const OTPScreen());
                  }
                },
                child: Text(
                  KStrings.signup.toUpperCase(),
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
