import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/on_boarding_controller.dart';
import 'package:flutter_e_commerce_app/features/shop/controller/home_controller.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/auth_repository_impl.dart';
import 'package:flutter_e_commerce_app/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> init() async {

  //! Local Storage
  await GetStorage.init();
  Get.lazyPut<LocalStorage>(() => LocalStorageImpl(deviceStorage: GetStorage()));

  //! Repositories
  // can not be put lazily because the onReady method has to be triggered immediatly after this init method
  Get.put<AuthRepository>(AuthRepositoryImpl(localStorage: Get.find()));

  //! Controller
  Get.lazyPut(() => OnBoardingController(localStorage: Get.find()));
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => NavigationController());

}