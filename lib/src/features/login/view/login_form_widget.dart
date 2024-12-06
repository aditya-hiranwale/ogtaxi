import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../extensions/esizedbox.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
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
                prefixIcon: Icon(Icons.person),
                labelText: KStrings.email,
                hintText: KStrings.email,
                border: OutlineInputBorder(),
              ),
            ),
            Esb.height(KSizes.k14pad),
            TextFormField(
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
                onPressed: () {},
                child: const Text(KStrings.forgotPass),
              ),
            ),
            Esb.height(KSizes.k14pad),
          ],
        ),
      ),
    );
  }
}
