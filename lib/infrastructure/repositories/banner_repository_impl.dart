import 'package:flutter_e_commerce_app/domain/entities/banner.dart';
import 'package:flutter_e_commerce_app/domain/repositories/banner_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/banner_extensions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/banner_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BannerRepositoryImpl extends BannerRepository {
  final SupabaseClient supabaseClient;

  BannerRepositoryImpl({required this.supabaseClient});

  @override
  Future<List<Banner>> getActiveBanners() async {
    try {
      final bannersJson = await supabaseClient.getActiveBanners();

      return bannersJson.map((cat) => BannerModel.fromJson(cat).toDomain()).toList();
    } catch (e) {
      print(e);
      throw 'Something went wrong';
    }
  }


}
