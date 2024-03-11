import 'package:flutter_e_commerce_app/features/authentication/controller/login/login_controller.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(authRepository: Get.find()));
    // used for googleSignIn
    Get.lazyPut(() => LoginController(
        authRepository: Get.find(),
        localDeviceStorage: Get.find())); 
  }
}
