import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
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
}
