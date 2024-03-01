import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final AuthRepository authRepository;

  SignupController({required this.authRepository});

  /// -- Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // start Loading
      DFullScreenLoader.openLoadingDialog(
          DTexts.signupLoadingDialog, DImages.loadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }
      // privacy policy check
      if (!privacyPolicy.value) {
        DLoaders.warningSnackBar(
            title: DTexts.acceptPrivacyPolicy,
            message: DTexts.acceptPrivacyPolicyMessage);
        DFullScreenLoader.stopLoading();
        return;
      }

      // save authenticated user data in supabase store
      final userData = UserDataModel(
        id: '', // not necessary, will be set by supabase
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: ''
      );

      // register user in the supabase authentication & save user data in supabase
      await authRepository.registerWithEmailAndPassword(email: email.text.trim(), password: password.text.trim(), userData: userData);

      // show success message
      DLoaders.successSnackBar(title: DTexts.congratulations, message: DTexts.successMessage);

      DFullScreenLoader.stopLoading();
      
      // move to verify email screen
      await Get.toNamed(Routes.verifyEmail);
      
    } catch (e) {
      // show some generic error to the user
      DLoaders.errorSnackBar(title: DTexts.error, message: e.toString());
      DFullScreenLoader.stopLoading();
    }
  }

  void toggleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void setPrivacyPolicy(bool? flag) {
    if (flag != null) {
      privacyPolicy.value = flag;
    }
  }

  @override
  void onClose() {
    super.onClose();
    print('signupController closed...');
  }
}
