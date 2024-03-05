import 'package:flutter_e_commerce_app/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:get/get.dart';

class VerifyEmailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailController(
        authRepository: Get.find()));
  }
}
