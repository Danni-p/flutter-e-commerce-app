import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_storage.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepositoryImpl extends AuthRepository {
  /// -- Variables
  final deviceStorage = GetStorage();

  final LocalStorage localStorage;

  AuthRepositoryImpl({required this.localStorage});

  /// -- Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    // Local Storage
    localStorage.cacheIsFirstTime(flag: true);
    localStorage.getCachedIsFirstTime() != true
        ? Get.offAllNamed(Routes.login)
        : Get.offAllNamed(Routes.onBoarding);
  }
}
