import 'dart:async';

import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  User? get currentUser;

  Stream<AuthState> get authStateChangeListener;

  Future<UserCredentials> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required UserData userData});

  Future<UserCredentials> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<void> sendVerificationEmail({required String email});

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> resetPassword({required String password});

  void screenRedirect();

  Future<void> logout();

  Future<void> signInWithGoogle();

  Future<void> deleteAccount();
}
