import 'dart:io';

import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/user_extensions.dart';

class UserRepositoryImpl extends UserRepository {
  final SupabaseClient supabaseClient;

  UserRepositoryImpl({required this.supabaseClient});

  /* @override
  Future<void> saveUser({required UserData userData}) async {
    try {
      await supabaseClient.usersCollection().upsert([UserDataModel.fromDomain(userData).toJson()]);
    } on PostgrestException catch (e) {
      throw DPostgresException(msg: e.message).message;
    } catch (e) {
      throw DUnknownException();
    }
  } */

  @override
  Future<UserData> fetchUser({required String? userId}) async {
    try {
      final userDataJson = await supabaseClient.getUserById(id: userId);

      return UserDataModel.fromJson(userDataJson).toDomain();
    } on NoUserFoundException catch (_) {
      return UserData.empty();
    } on PostgrestException catch (e) {
      throw DPostgresException(msg: e.message).message;
    } catch (e) {
      print('fetchUser error: $e');
      throw DUnknownException();
    }
  }

  @override
  Future<void> updateUser({required UserDataModel userDataModel}) async {
    try {
      if (userDataModel.id.isEmpty) {
        throw 'user id is unknown';
      }

      await supabaseClient
          .usersCollection()
          .update(userDataModel.toJson())
          .match({'id': userDataModel.id});
    } on PostgrestException catch (e) {
      throw DPostgresException(msg: e.message).message;
    } catch (e) {
      throw DUnknownException();
    }
  }

  @override
  Future<String> uploadImage(
      {required StorageBucket bucket, required String path, required XFile imageFile}) async {
    try {
      if (path.isEmpty) {
        throw "No path detected";
      }

      final imageBytes = await imageFile.readAsBytes();
      final responseUrl = await supabaseClient.storage
          .from(bucket.value)
          .uploadBinary(path, imageBytes,
              fileOptions: const FileOptions(upsert: true));
      
      print('Image uploaded successfully $responseUrl');
      return await supabaseClient.storage
          .from(bucket.value).createSignedUrl(path, 10);
    } catch (e) {
      print('Upload error: $e');
      throw ("Upload image error occured.");
    }
  }

  @override
  Future<File> downloadImage({required StorageBucket bucket, required String path}) async {
    try {
      final imageByteList = await supabaseClient.storage
          .from(bucket.value)
          .download(path);
      print('Image download successfully');
      return File.fromRawPath(imageByteList);
    } catch (e) {
      print('Dowload error: $e');
      throw ("Downlaod image error occured.");
    }
  }
}
