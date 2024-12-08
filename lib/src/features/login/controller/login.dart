import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';

class LoginCtlr extends GetxController {
  //
  static LoginCtlr get instance => Get.find();

  //textfield controllers
  final TextEditingController emailCtlr = TextEditingController();
  final TextEditingController phoneCtlr = TextEditingController();
  final TextEditingController passCtlr = TextEditingController();

  //login user
  void loginUser(String email, String pass) {
    //
    AuthRepo.instance.loginUserWithEmailAndPass(
      email,
      pass,
    );
  }

  //google login
  void loginWithGoogle() async {
    //
    await AuthRepo.instance.signinWithGoogle();
    AuthRepo.instance.setInitialScreen(AuthRepo.instance.firebaseUser.value);
  }
}
