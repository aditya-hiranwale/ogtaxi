import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';

class SignupCtlr extends GetxController {
  //
  static SignupCtlr get instance => Get.find();

  //textfield controllers
  final TextEditingController fullNameCtlr = TextEditingController();
  final TextEditingController emailCtlr = TextEditingController();
  final TextEditingController phoneCtlr = TextEditingController();
  final TextEditingController passCtlr = TextEditingController();
  final TextEditingController confirmPassCtlr = TextEditingController();

  RxBool obscureTxt = true.obs;
  RxBool isloading = false.obs;

  void toggleObscureTxt() {
    obscureTxt.value = !obscureTxt.value;
  }

  //toggle loading
  void toggleLoading() {
    isloading.value = !isloading.value;
    update();
  }

  //register user
  void registerUser(String email, String pass) {
    //
    toggleLoading();
    AuthRepo.instance.createUserWithEmailAndPass(
      email,
      pass,
    );
    toggleLoading();
  }

  //email auth
  void userEmailAuth(String email) {
    //
    AuthRepo.instance.emailAuth();
  }

  //phone auth
  void userPhoneAuth(String phone) {
    //
    AuthRepo.instance.phoneAuth(phone);
  }
}
