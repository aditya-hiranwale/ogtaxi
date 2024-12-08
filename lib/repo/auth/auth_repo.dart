import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ogtaxi/repo/exceptions/signup_failure.dart';
import 'package:ogtaxi/src/features/accrecovery/view/mail_verify_screen.dart';
import 'package:ogtaxi/src/features/home/view/home_screen.dart';
import 'package:ogtaxi/src/features/welcome/welc_screen.dart';

class AuthRepo extends GetxController {
  //
  static AuthRepo get instance => Get.find();

  //vars
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    //
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
    setInitialScreen(firebaseUser.value);
  }

  setInitialScreen(User? user) {
    // this directs user to appropriate screen whenever a change is detected
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => const HomeScreen())
            : Get.offAll(() => const EmailVerifyScreen());
  }

  Future<void> createUserWithEmailAndPass(String email, String pass) async {
    try {
      //
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      // firebaseUser.value == null
      //     ? Get.offAll(() => const WelcomeScreen())
      //     : Get.offAll(() => const HomeScreen());
      setInitialScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      log('Exception in create user, ${e.code}');
      final ex = SignupFailure.code(e.code);
      log('Processed Exception, ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupFailure();
      log('Normal Exception, ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPass(String email, String pass) async {
    try {
      //
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      // firebaseUser.value == null
      //     ? Get.offAll(() => const WelcomeScreen())
      //     : Get.offAll(() => const HomeScreen());
      setInitialScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      log('Exception in create user, ${e.code}');
      final ex = SignupFailure.code(e.code);
      log('Processed Exception, ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupFailure();
      log('Normal Exception, ${ex.message}');
      throw ex;
    }
  }

  Future<UserCredential?> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      //creating new cred
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //after signin, return creds
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log('Exception in create user, ${e.code}');
      final ex = SignupFailure.code(e.code);
      log('Processed Exception, ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupFailure();
      log('Normal Exception, ${ex.message}');
      throw ex;
    }
  }

  Future<void> emailAuth() async {
    //
    try {
      //
      await _auth.currentUser?.sendEmailVerification();
      // firebaseUser.value == null
      //     ? Get.offAll(() => const WelcomeScreen())
      //     : Get.offAll(() => const HomeScreen());
      setInitialScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      log('Exception in  email verif, ${e.code}');
      final ex = SignupFailure.code(e.code);
      log('Processed Exception, ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupFailure();
      log('Normal Exception, ${ex.message}');
      throw ex;
    }
  }

  Future<void> phoneAuth(String phone) async {
    //
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credential) async {
        //sign user in with credentials on success
        await _auth.signInWithCredential(credential);
        setInitialScreen(firebaseUser.value);
      },
      verificationFailed: (e) {
        //retrieve code
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "The provided number is invalid");
        } else {
          Get.snackbar("Error", "Something went wrong!");
        }
      },
      codeSent: (verificationId, resendToken) {
        //when code is sent to user
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verification) {
        verificationId.value = verification;
      },
    );
  }

  Future<bool> verifyOtp(String otp) async {
    var creds = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ),
    );
    return creds.user != null ? true : false;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    firebaseUser.value = null;
    setInitialScreen(firebaseUser.value);
  }
}
