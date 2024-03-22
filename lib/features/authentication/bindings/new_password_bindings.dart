import 'package:flutter_e_commerce_app/features/authentication/controller/forget-password/new_password_controller.dart';
import 'package:get/get.dart';

class NewPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController(authRepository: Get.find()));
  }
}
