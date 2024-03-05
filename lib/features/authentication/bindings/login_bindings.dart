import 'package:flutter_e_commerce_app/features/authentication/controller/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
