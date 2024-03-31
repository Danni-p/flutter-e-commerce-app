import 'package:flutter_e_commerce_app/features/personalization/controller/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(authRepository: Get.find()));
  }
}
