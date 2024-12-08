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

  //register user
  void registerUser(String email, String pass) {
    //
    AuthRepo.instance.createUserWithEmailAndPass(
      email,
      pass,
    );
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
