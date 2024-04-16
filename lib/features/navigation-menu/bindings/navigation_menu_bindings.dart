import 'package:flutter_e_commerce_app/features/navigation-menu/navigation_menu.dart';
import 'package:flutter_e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:flutter_e_commerce_app/features/shop/controller/home_controller.dart';
import 'package:get/get.dart';

class NavigationMenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()), fenix: true);
  }
}
