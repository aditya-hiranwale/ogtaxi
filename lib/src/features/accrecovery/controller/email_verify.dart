import 'package:firebase_auth/firebase_auth.dart';
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

  final isloading = false.obs;

  //toggle loading
  void toggleLoading() {
    isloading.value = !isloading.value;
    // update();
  }

  //email auth
  void sendEmailVerification() async {
    //
    await AuthRepo.instance.emailAuth();
    // isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }

  void checkIfEmailVerified() async {
    toggleLoading();
    //
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      //
      AuthRepo.instance.setInitialScreen(user);
    }
    toggleLoading();
  }
}
