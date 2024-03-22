import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:get/get.dart';

abstract class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  Future<UserCredentials> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required UserDataModel userData});

  Future<UserCredentials> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<void> sendVerificationEmail({required String email});

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> resetPassword({required String password});

  void screenRedirect();

  Future<void> logout();

  Future<void> signInWithGoogle();
}
