import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/personalization/user_data_controller.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ChangeFullNameController extends GetxController {
  static ChangeFullNameController get instance => Get.find();

  final UserDataController userDataController;
  final UserRepository userRepository;

  ChangeFullNameController(
      {required this.userDataController, required this.userRepository});

  /// -- Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> changeFullNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initNames() async {
    firstName.text = userDataController.userData.value.firstName;
    lastName.text = userDataController.userData.value.lastName;
  }

  void updateFullName() async {
    try {
      // Start Loading
      DFullScreenLoader.openLoadingDialog(
          'We are updating your information...', DImages.loadingAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        DFullScreenLoader.stopLoading();
      }

      if (!changeFullNameFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
      }

      // Update users first & last name in backend
      await userDataController.updateFirstAndLastName(firstName: firstName.text.trim(), lastName: lastName.text.trim());

      // Update Rx user value
      userDataController.userData.value = userDataController.userData.value
          .copyWith(
              firstName: firstName.text.trim(), lastName: lastName.text.trim());

      DFullScreenLoader.stopLoading();

      // show success message
      DLoaders.successSnackBar(title: DTexts.congratulations, message: 'Your full Name has been updated.');

      Get.offNamed(Routes.profile);
    } catch (e) {
      DFullScreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e);
    }
  }
}
