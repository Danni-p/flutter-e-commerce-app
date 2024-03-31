import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/supabase_auth_exception.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/edge_functions_extensions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/user_extensions.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LocalDeviceStorage localDeviceStorage;
  final SupabaseClient supabaseClient;
  late StreamSubscription<AuthState> authStreamSubscription;
  final _baseUri = 'https://ecommerce.akdgames.de';
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
    onAuthStateChangedListener();
    screenRedirect();
  }

  @override
  void onClose() {
    authStreamSubscription.cancel();
    super.onClose();
  }

  void onAuthStateChangedListener() {
    authStreamSubscription = authStateChangeListener.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      print('auth state changed: $event , $session');
      if (event == AuthChangeEvent.passwordRecovery) {
        Get.offAllNamed(Routes.newPassword);
        // handle initial session
      } else if (event == AuthChangeEvent.signedIn) {
        print("signed in...");
        // handle sign in event
      } else if (event == AuthChangeEvent.initialSession) {
        // Get.offAllNamed(Routes.login);
        // handle sign in event
      }  else if (event == AuthChangeEvent.signedOut) {
        // handle sign out event
      } else if (event == AuthChangeEvent.userDeleted) {
        // handle password recovery event
      } else if (event == AuthChangeEvent.tokenRefreshed) {
        // handle token refreshed event
      } else if (event == AuthChangeEvent.userUpdated) {
        // handle user updated event
      }
    });
  }

  @override
  void screenRedirect() {
    print('call screen redirect...');
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
  User? get currentUser => supabaseClient.auth.currentUser;

  @override
  Future<UserCredentials> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required UserData userData}) async {
    try {
      final authResponse = await supabaseClient.auth.signUp(
          email: email,
          password: password,
          data: UserDataModel.fromDomain(userData).toJson(),
          emailRedirectTo: '$_baseUri${Routes.login}');

      if (authResponse.user == null) {
        throw 'Something went really wrong';
      }
      print(authResponse);
      return authResponse.user!.toDomain();
    } on AuthException catch (e) {
      throw DAuthException(msg: e.message).message;
    } catch (e) {
      // ClientException with SocketException
      print(e);
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
  Future<void> sendVerificationEmail({required String email}) async {
    try {
      if (email.isEmpty) {
        throw DNoEmailProvidedException();
      }

      await supabaseClient.auth.resend(
          type: OtpType.signup, email: email, emailRedirectTo: '$_baseUri${Routes.login}');
    } catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      if (email.isEmpty) {
        throw DNoEmailProvidedException();
      }

      await supabaseClient.auth.resetPasswordForEmail(email, redirectTo: '$_baseUri${Routes.newPassword}');
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
    }on PlatformException catch (e) {
      print('platform exception: ${e.message}:${e.code}:${e.details}');
      throw e.message ?? 'A Platform Exception has been occured.';
    } catch (e) {
      print('sth is really wrong $e');
      throw DSupabaseAuthExceptionMapper.getException(e.toString());
    }
  }

  @override
  Future<void> resetPassword({required String password}) async {
    try {
      await supabaseClient.auth.updateUser(UserAttributes(password: password));
    } on AuthException catch (e) {
      throw DSupabaseAuthExceptionMapper.getException(e.message);
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
  Stream<AuthState> get authStateChangeListener => supabaseClient.auth.onAuthStateChange;
  
  @override
  Future<void> deleteAccount() async {
    try {
      await supabaseClient.functions.deleteAccount();
    } on FunctionException catch (e) {
      print("${e.status} : ${e.details}");
    }
    
  }
}
