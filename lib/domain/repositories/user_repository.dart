import 'dart:io';

import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  Future<void> updateUser({required UserDataModel userDataModel});
  Future<UserData> fetchUser({required String? userId});
  Future<String> uploadImage({required StorageBucket bucket, required String path, required XFile imageFile});
  Future<File> downloadImage({required StorageBucket bucket, required String path});
}
