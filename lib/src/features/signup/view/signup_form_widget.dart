import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/src/features/signup/controller/signup.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class SignupFormWidget extends StatelessWidget {
  final SignupCtlr ctlr;
  const SignupFormWidget({
    super.key,
    required this.ctlr,
  });

  String? validateUserEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateField(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    // Add more  validation logic if needed
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    ctlr.phoneCtlr.text = "+91";
    return Obx(() {
      return Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              //
              TextFormField(
                controller: ctlr.fullNameCtlr,
                validator: validateField,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity_rounded),
                  labelText: KStrings.fullName,
                  hintText: KStrings.fullName,
                ),
              ),
              Esb.height(KSizes.k14pad),
              TextFormField(
                controller: ctlr.emailCtlr,
                validator: validateUserEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: KStrings.email,
                  hintText: KStrings.email,
                ),
              ),
              Esb.height(KSizes.k14pad),
              TextFormField(
                controller: ctlr.phoneCtlr,
                validator: validateField,
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
                validator: validateField,
                obscureText: ctlr.obscureTxt.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: KStrings.pass,
                  hintText: KStrings.pass,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctlr.toggleObscureTxt();
                    },
                    icon: Icon(ctlr.obscureTxt.value
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye),
                  ),
                ),
              ),
              Esb.height(KSizes.k14pad),
              TextFormField(
                controller: ctlr.confirmPassCtlr,
                validator: (value) =>
                    validateConfirmPassword(value, ctlr.passCtlr.text),
                obscureText: ctlr.obscureTxt.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: KStrings.passConfirm,
                  hintText: KStrings.passConfirm,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctlr.toggleObscureTxt();
                    },
                    icon: Icon(ctlr.obscureTxt.value
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye),
                  ),
                ),
              ),
              Esb.height(KSizes.k14pad),
              // Obx(
              //   () =>
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //
                    if (formkey.currentState!.validate()) {
                      //signup user
                      ctlr.registerUser(ctlr.emailCtlr.text.trim(),
                          ctlr.confirmPassCtlr.text.trim());

                      //verify user phone (billing needed to run)
                      // ctlr.userPhoneAuth(ctlr.phoneCtlr.text.trim());
                      // Get.to(() => const OTPScreen());
                    }
                  },
                  child: Text(
                    KStrings.signup.toUpperCase(),
                    textAlign: TextAlign.center,
                    // style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
