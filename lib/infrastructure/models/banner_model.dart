import 'package:flutter_e_commerce_app/domain/entities/banner.dart';
import 'package:get/get.dart';

class BannerModel {
  final int id;
  final String? targetScreen;
  final String? imageUrl;
  final bool? active;

  BannerModel(
      {required this.id, this.targetScreen, this.imageUrl, this.active});

  BannerModel copyWith(
      {int? id, String? targetScreen, String? imageUrl, bool? active}) {
    return BannerModel(
        id: id ?? this.id,
        targetScreen: targetScreen ?? this.targetScreen,
        imageUrl: imageUrl ?? this.imageUrl,
        active: active ?? this.active);
  }

  factory BannerModel.empty() => BannerModel(id: -1);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json.addIf(targetScreen != null, 'target_screen', targetScreen);
    json.addIf(imageUrl != null, 'image_url', imageUrl);
    json.addIf(active != null, 'active', active);

    return json;
  }

  factory BannerModel.fromJson(Map<String, dynamic> bannerRecord) {
    return BannerModel(
        targetScreen: bannerRecord['target_screen'],
        imageUrl: bannerRecord['image_url'],
        active: bannerRecord['active'],
        id: bannerRecord['id']);
  }

  Banner toDomain() {
    return Banner(
        id: id,
        targetScreen: targetScreen ?? '',
        imageUrl: imageUrl ?? '',
        active: active ?? false);
  }

  factory BannerModel.fromDomain(Banner banner) => BannerModel(
      id: banner.id,
      targetScreen: banner.targetScreen,
      imageUrl: banner.imageUrl,
      active: banner.active);
}
