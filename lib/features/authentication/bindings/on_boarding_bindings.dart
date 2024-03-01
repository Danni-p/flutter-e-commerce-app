import 'package:flutter_e_commerce_app/features/authentication/controller/on-boarding/on_boarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController(localDeviceStorage: Get.find()));
  }
}
