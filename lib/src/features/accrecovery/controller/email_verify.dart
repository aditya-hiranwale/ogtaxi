import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';

class EmailVerifyCtlr extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  //
  static EmailVerifyCtlr get instance => Get.find();

  //email auth
  void sendEmailVerification() async {
    //
    await AuthRepo.instance.emailAuth();
    // isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }

  void checkIfEmailVerified() async {
    //
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      //
      AuthRepo.instance.setInitialScreen(user);
    }
  }
}
