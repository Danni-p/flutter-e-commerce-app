
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/entities/banner.dart' as dp;
import 'package:flutter_e_commerce_app/domain/repositories/banner_repository.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';

import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final BannerRepository bannerRepository;

  BannerController({required this.bannerRepository});

  /// Variables
  final pageController = PageController();
  Rx<int> currentCarouselIndex = 0.obs;
  final RxList<dp.Banner> activeBanners = <dp.Banner>[].obs;
  final isLoading = false.obs;
  
  /// Update Current Index when Page scroll
  void updatePageIndicator(index) => currentCarouselIndex.value = index;

@override
  onInit() {
    super.onInit();
    fetchBanners();
  }

  /// -- Load category data
  Future<void> fetchBanners() async {
    try {
      // show loader while loading banners
      isLoading.value = true;

      // fetch banners from data source
      final banners = await bannerRepository.getActiveBanners();
      // update the bFanners list
      activeBanners.assignAll(banners);

      // filter featured categories
      // featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId == null).take(8).toList());
    } catch (e) {
      print(e);
      DLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
  /// Fetch Banners
  
}