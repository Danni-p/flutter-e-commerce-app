import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension UserExtensions on User {
  UserCredentials toDomain() {
    return UserCredentials(id: id);
  }
}

extension SupabaseHelpers on SupabaseClient {
  SupabaseQueryBuilder usersCollection() {
    return Supabase.instance.client.from("profiles");
  }

  Future<Map<String, dynamic>> getUserById({required String? id}) async {
    final userData = (await Supabase.instance.client
            .usersCollection()
            .select('*')
            .eq('id', id ?? ''))
        .firstOrNull;

    if (userData == null) {
      throw NoUserFoundException();
    }

    return userData;
  }
}
