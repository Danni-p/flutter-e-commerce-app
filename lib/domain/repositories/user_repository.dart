import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:get/get.dart';

abstract class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  Future<void> saveUserRecord({required UserDataModel userData});
}
