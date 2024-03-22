import 'dart:async';

import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final AuthRepository authRepository;

  VerifyEmailController({required this.authRepository});

  /// Send Email Verification link
  sendEmailVerification({required String email}) async {
    try {
      await AuthRepository.instance.sendVerificationEmail(email: email);
      DLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email!');
    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  /*setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      print('tick');
      if (await authRepository.isEmailConfirmed()) {
        print('email confirmed...');
        timer.cancel();
        _redirectToSuccess();
      }
    });
  } */

  /// Manually check if email verified
  Future<void> redirectToSuccessIfConfirmed(
      {required String email, required String password}) async {
    try {
      await authRepository.loginWithEmailAndPassword(
          email: email, password: password);
      Get.toNamed(Routes.success, arguments: {
        'image': DImages.staticSuccessIllustration,
        'title': DTexts.yourAccountCreatedTitle,
        'subTitle': DTexts.yourAccountCreatedSubTitle,
        'primaryBtnText': DTexts.continueText,
        'onPrimaryPressed': () => authRepository.screenRedirect()
      });
    } on DEmailUnconfirmedException catch (_) {
      // Email still not verified
      DLoaders.warningSnackBar(
          title: 'Email still not verified',
          message: 'Please check your inbox and verify your email!');
    } catch (e) {
      // something is wrong
      DLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
