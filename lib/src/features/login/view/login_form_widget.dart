import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/login/controller/login.dart';
import 'package:ogtaxi/src/features/login/view/forgotpass_modal.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';
import '../../home/view/home_screen.dart';
import '../../signup/controller/signup.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ctlr = Get.put(LoginCtlr());
    final formkey = GlobalKey<FormState>();
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            //
            TextFormField(
              controller: ctlr.emailCtlr,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: KStrings.email,
                hintText: KStrings.email,
                border: OutlineInputBorder(),
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              controller: ctlr.passCtlr,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: KStrings.pass,
                hintText: KStrings.pass,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            Esb.height(KSizes.k14pad),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  //
                  ForgotPassModal.forgotpassmodal(context);
                },
                child: const Text(KStrings.forgotPass),
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
                    ctlr.loginUser(
                      ctlr.emailCtlr.text.trim(),
                      ctlr.passCtlr.text.trim(),
                    );
                  }
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
