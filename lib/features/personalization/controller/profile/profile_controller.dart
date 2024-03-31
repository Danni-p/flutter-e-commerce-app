import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final AuthRepository authRepository;

  ProfileController({required this.authRepository});

  void showDeleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(DSizes.md),
        title: DTexts.deleteAccount,
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () => deleteAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: DColors.error,
                side: const BorderSide(color: DColors.error)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: DSizes.lg),
              child: Text(DTexts.delete),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text(DTexts.cancel)));
  }

  Future<void> deleteAccount() async {
    try {
      DFullScreenLoader.openLoadingDialog(
          DTexts.processing, DImages.loadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      await authRepository.deleteAccount();
      DFullScreenLoader.stopLoading();
      Get.offAllNamed(Routes.login);
    } catch (e) {
      print(e);
      DFullScreenLoader.stopLoading();
      DLoaders.warningSnackBar(title: 'Oh Snap', message: e);
    }
  }
}
