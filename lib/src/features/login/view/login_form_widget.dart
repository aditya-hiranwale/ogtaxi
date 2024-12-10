import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/common_widgets/form/loading_widget.dart';
import 'package:ogtaxi/src/features/login/controller/login.dart';
import 'package:ogtaxi/src/features/login/view/forgotpass_modal.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
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
              validator: validateUserEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: KStrings.email,
                hintText: KStrings.email,
                border: OutlineInputBorder(),
              ),
            ),
            Esb.height(KSizes.k14pad),
            Obx(() {
              return
                  //
                  TextFormField(
                controller: ctlr.passCtlr,
                validator: validateField,
                obscureText: ctlr.obscureTxt.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: KStrings.pass,
                  hintText: KStrings.pass,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctlr.toggleObscureText();
                    },
                    icon: Icon(
                      ctlr.obscureTxt.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              );
            }),
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

            Obx(
              () => ctlr.isloading.value
                  ? const LoadingButton()
                  : SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
