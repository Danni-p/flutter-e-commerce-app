import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/user_credentials_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LocalDeviceStorage localDeviceStorage;
  final SupabaseClient supabaseClient;

  AuthRepositoryImpl(
      {required this.localDeviceStorage, required this.supabaseClient});

  /// -- Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    // Local Storage
    localDeviceStorage.cacheIsFirstTime(flag: true);
    localDeviceStorage.getCachedIsFirstTime() != true
        ? Get.offAllNamed(Routes.login)
        : Get.offAllNamed(Routes.onBoarding);
  }

  @override
  Future<UserCredentials> registerWithEmailAndPassword(
      {required String email, required String password, required UserDataModel userData}) async {
    try {
      final authResponse = await supabaseClient.auth.signUp(email: email, password: password, data: userData.toJson());
      
      if (authResponse.user == null) {
        throw 'Something went really wrong';
      }

      return authResponse.user!.toDomain();
    } on AuthException catch (e) {
      throw DAuthException(msg: e.message).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
