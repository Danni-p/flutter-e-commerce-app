import 'package:flutter_e_commerce_app/features/personalization/controller/profile/change_full_name_controller.dart';
import 'package:get/get.dart';

class ChangeFullNameBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeFullNameController(userDataController: Get.find(), userRepository: Get.find()));
  }
}
