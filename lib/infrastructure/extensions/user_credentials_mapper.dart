import 'package:flutter_e_commerce_app/domain/entities/user_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension UserCredentialsMapper on User {
  UserCredentials toDomain() {
    return UserCredentials(
        id: id);
  }
}
