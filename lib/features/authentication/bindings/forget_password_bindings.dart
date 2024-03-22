import 'package:flutter_e_commerce_app/features/authentication/controller/forget-password/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController(authRepository: Get.find()));
  }
}
