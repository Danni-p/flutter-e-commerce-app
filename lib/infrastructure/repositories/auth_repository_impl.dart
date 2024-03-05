import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/user_credentials_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LocalDeviceStorage localDeviceStorage;
  final SupabaseClient supabaseClient;
  final _redirectUri = 'io.supabase.flutterquickstart://login-callback/';

  AuthRepositoryImpl(
      {required this.localDeviceStorage, required this.supabaseClient});

  /// -- Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  @override
  void screenRedirect() {
    final user = supabaseClient.auth.currentUser;
    if (user != null) {
      if (user.emailConfirmedAt != null) {
        // logged in and verified
        Get.offAllNamed(Routes.navigationMenu);
      } else {
        Get.offAllNamed(Routes.verifyEmail, arguments: {"email": user.email});
      }
    } else {
      // Local Storage
      localDeviceStorage.cacheIsFirstTime(
          flag: true); // only writes if not null
      localDeviceStorage.getCachedIsFirstTime() != true
          ? Get.offAllNamed(Routes.login)
          : Get.offAllNamed(Routes.onBoarding);
    }
  }

  @override
  Future<UserCredentials> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required UserDataModel userData}) async {
    try {
      final authResponse = await supabaseClient.auth.signUp(
          email: email,
          password: password,
          data: userData.toJson(),
          emailRedirectTo: _redirectUri);

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

  @override
  Future<UserCredentials> loginWithEmailAndPassword(
      {required String email,
      required String password}) async {
    try {
      final authResponse = await supabaseClient.auth.signInWithPassword(
          email: email,
          password: password);

      if (authResponse.user == null) {
        throw DSupabaseAuthExceptionMapper.getException('Something went really wrong');
      }

      return authResponse.user!.toDomain();
    } on AuthException catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.message);
    } catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  @override
  Future<void> sendEmailVerification({required String email}) async {
    try {
      if (email.isEmpty) {
        throw DNoEmailProvidedException();
      }

      await supabaseClient.auth.resend(
          type: OtpType.signup,
          email: email,
          emailRedirectTo: _redirectUri);
    } catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabaseClient.auth.signOut();
      screenRedirect();
    } on AuthException catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.message);
    } catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  @override
  Future<bool> isEmailConfirmed() async {
    print('before: ${supabaseClient.auth.getUser()}');
    // await supabaseClient.auth.refreshSession();
    // print('after: ${supabaseClient.auth.getUser()}');
    return supabaseClient.auth.currentUser?.emailConfirmedAt?.isNotEmpty ?? false;
  }
}
