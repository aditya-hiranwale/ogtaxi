import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            //
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.perm_identity_rounded),
                labelText: KStrings.fullName,
                hintText: KStrings.fullName,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: KStrings.email,
                hintText: KStrings.email,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: KStrings.mobile,
                hintText: KStrings.mobile,
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
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
          ],
        ),
      ),
    );
  }
}
