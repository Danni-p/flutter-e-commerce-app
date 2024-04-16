import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseCategoryHelpers on SupabaseClient {
  SupabaseQueryBuilder categoryCollection() {
    return Supabase.instance.client.from("categories");
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    return (await Supabase.instance.client
            .categoryCollection()
            .select('*')).toList();
  }
}
