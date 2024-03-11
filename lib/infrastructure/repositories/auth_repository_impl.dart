import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/user_credentials_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LocalDeviceStorage localDeviceStorage;
  final SupabaseClient supabaseClient;
  final _redirectUri = 'io.supabase.flutterquickstart://login-callback/';
  final _iosClientId =
      '902998645100-jv7i77n1cqovjunpnvhenvutde9oiicc.apps.googleusercontent.com';
  final _webClientId =
      '902998645100-fsdakjdjffticao02dq56gogdo00cjgb.apps.googleusercontent.com';

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
      localDeviceStorage.cacheValue(
          cacheKey: CacheKey.isFirstTime,
          value: true); // only writes if not null
      final cachedIsFirstTime =
          localDeviceStorage.getCachedValue<bool>(CacheKey.isFirstTime) ??
              false;
      cachedIsFirstTime
          ? Get.offAllNamed(Routes.onBoarding)
          : Get.offAllNamed(Routes.login);
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
      {required String email, required String password}) async {
    try {
      final authResponse = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);

      if (authResponse.user == null) {
        throw DSupabaseAuthExceptionMapper.getException(
            'Something went really wrong');
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
          type: OtpType.signup, email: email, emailRedirectTo: _redirectUri);
    } catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  /// [GoogleAuthentication] - GOOGLE
  @override
  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn =
          GoogleSignIn(clientId: _iosClientId, serverClientId: _webClientId);
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw "No acesstoken found";
      }
      if (idToken == null) {
        throw "No ID token found";
      }

      await supabaseClient.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken);
    } on AuthException catch (e) {
      print('auth exception: ${e.message}');
      throw DSupabaseAuthExceptionMapper.getException(e.message);
    } catch (e) {
      print(e);
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
}
