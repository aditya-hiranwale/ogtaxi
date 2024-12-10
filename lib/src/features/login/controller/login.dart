import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';

class LoginCtlr extends GetxController {
  //
  static LoginCtlr get instance => Get.find();

  //textfield controllers
  final TextEditingController emailCtlr =
      TextEditingController(text: "aditya8hiranwale@gmail.com");
  final TextEditingController phoneCtlr = TextEditingController();
  final TextEditingController passCtlr = TextEditingController();

  RxBool obscureTxt = true.obs;
  final isloading = false.obs;

  //toggle pass
  void toggleObscureText() {
    obscureTxt.value = !obscureTxt.value;
  }

  //toggle loading
  void toggleLoading() {
    isloading.value = !isloading.value;
    update();
  }

  //login user
  void loginUser(String email, String pass) {
    //
    toggleLoading();
    AuthRepo.instance.loginUserWithEmailAndPass(
      email,
      pass,
    );
    toggleLoading();
  }

  //google login
  void loginWithGoogle() async {
    //
    toggleLoading();
    await AuthRepo.instance.signinWithGoogle();
    AuthRepo.instance.setInitialScreen(AuthRepo.instance.firebaseUser.value);
    toggleLoading();
  }
}
