import 'package:get/get.dart';
import 'package:ogtaxi/repo/auth/auth_repo.dart';
import 'package:ogtaxi/src/features/home/view/home_screen.dart';

class OtpCtlr extends GetxController {
  //
  static OtpCtlr get instance => Get.find();

  //phone auth
  void verifyOtp(String otp) async {
    //
    var isVerified = await AuthRepo.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }
}
