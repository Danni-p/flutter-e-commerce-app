import 'package:flutter_e_commerce_app/domain/entities/banner.dart';
import 'package:get/get.dart';

abstract class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  Future<List<Banner>> getActiveBanners();
}
