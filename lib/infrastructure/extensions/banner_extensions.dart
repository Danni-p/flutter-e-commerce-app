import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseCategoryHelpers on SupabaseClient {
  SupabaseQueryBuilder bannerCollection() {
    return Supabase.instance.client.from("banners");
  }

  Future<List<Map<String, dynamic>>> getActiveBanners() async {
    return (await Supabase.instance.client
            .bannerCollection()
            .select('*').eq('active', true)).toList();
  }
}
