import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseHelpers on SupabaseClient {
  SupabaseQueryBuilder usersCollection() {
    return Supabase.instance.client.from("profiles");
  }

  Future<List<Map<String,dynamic>>> getUserById({required String id}) async {
    return await Supabase.instance.client.usersCollection().select('*').eq('id', id);
  }
} 
