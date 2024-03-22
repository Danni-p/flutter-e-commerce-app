import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final AuthRepository authRepository;

  ForgetPasswordController(
      {required this.authRepository});

  /// -- Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  void sendPasswordResetEmail() async {
    try {
      // start Loading
      DFullScreenLoader.openLoadingDialog(
          DTexts.forgetPasswordLoadingDialog, DImages.loadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // register user in the supabase authentication & save user data in supabase
      await authRepository.sendPasswordResetEmail(
          email: email.text.trim());

      DFullScreenLoader.stopLoading();

      DLoaders.successSnackBar(title: DTexts.emailSent, message: DTexts.emailSentDescription);

      // move to reset password screen email screen
      Get.off(() => const SuccessScreen(), arguments: {
        'image': DImages.staticSuccessIllustration,
        'title': DTexts.changeYourPasswordTitle,
        'subTitle': DTexts.changeYourPasswordSubTitle,
        'onPrimaryPressed': () => Get.offAllNamed(Routes.login),
        'primaryBtnText': DTexts.done,
        'secondaryBtnText': DTexts.resendEmail,
        'onSecondaryPressed': () => resendPasswordResetEmail(email: email.text.trim())
      });
    } on DSupabaseAuthException catch (e) {
      // show some generic error to the user
      print(e.message);
      DLoaders.errorSnackBar(title: DTexts.error, message: e.message);
      DFullScreenLoader.stopLoading();
    } catch (e) {
      // show some generic error to the user
      print(e);
      DLoaders.errorSnackBar(title: DTexts.error, message: e.toString());
      DFullScreenLoader.stopLoading();
    }
  }

  void resendPasswordResetEmail({required String email}) async {
    try {
      // start Loading
      DFullScreenLoader.openLoadingDialog(
          DTexts.forgetPasswordLoadingDialog, DImages.loadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      await authRepository.sendPasswordResetEmail(
          email: email.trim());

      DFullScreenLoader.stopLoading();

      DLoaders.successSnackBar(title: DTexts.emailSent, message: DTexts.emailSentDescription);

    } on DSupabaseAuthException catch (e) {
      // show some generic error to the user
      DLoaders.errorSnackBar(title: DTexts.error, message: e.message);
      DFullScreenLoader.stopLoading();
    } catch (e) {
      // show some generic error to the user
      DLoaders.errorSnackBar(title: DTexts.error, message: e.toString());
      DFullScreenLoader.stopLoading();
    }
  }
}
