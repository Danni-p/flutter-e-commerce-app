import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/utils/helpers/supabase_helpers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl extends UserRepository {
  final SupabaseClient supabaseClient;

  UserRepositoryImpl(
      {required this.supabaseClient});

  @override
  Future<void> saveUserRecord({required UserDataModel userData}) async {
    try {
      await supabaseClient.profilesCollection().insert([userData.toJson()]);
    } on PostgrestException catch (e) {
      throw DPostgresException(msg: e.message).message;
    } catch (e) {
      throw DUnknownException();
    }
  }
}
