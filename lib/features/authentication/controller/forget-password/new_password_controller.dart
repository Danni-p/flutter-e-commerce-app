import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart'; 
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  static NewPasswordController get instance => Get.find();

  final AuthRepository authRepository;

  NewPasswordController(
      {required this.authRepository});

  /// -- Variables
  final hidePassword = true.obs;
  final password = TextEditingController();
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  void resetPassword() async {
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
      if (!newPasswordFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // register user in the supabase authentication & save user data in supabase
      await authRepository.resetPassword(
          password: password.text.trim());

      DFullScreenLoader.stopLoading();

      DLoaders.successSnackBar(title: DTexts.passwordChanged, message: DTexts.passwordChangedDescription);

      // move to reset password screen email screen
      Get.off(() => const SuccessScreen(), arguments: {
        'image': DImages.staticSuccessIllustration,
        'title': DTexts.changedPasswordTitle,
        'subTitle': DTexts.changedPasswordSubTitle,
        'onPrimaryPressed': () => authRepository.screenRedirect(),
        'primaryBtnText': DTexts.done
              });
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

  void toggleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }
}
