import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  /// -- Variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// -- LOGIN
  void login() async {
    try {
      // start Loading
      DFullScreenLoader.openLoadingDialog(
          DTexts.loginLoadingDialog, DImages.loadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // register user in the supabase authentication & save user data in supabase
      await authRepository.loginWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      DFullScreenLoader.stopLoading();

      // move to verify email screen
      await Get.toNamed(Routes.navigationMenu);
    } on DEmailUnconfirmedException catch (_) {
      Get.toNamed(Routes.verifyEmail, arguments: {
        "email": email.text.trim(),
        "password": password.text.trim()
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
