import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final LocalDeviceStorage localDeviceStorage;

  OnBoardingController({required this.localDeviceStorage});

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  
  /// Update Current Index when Page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page 
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index.toDouble());
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      localDeviceStorage.cacheValue(cacheKey: CacheKey.isFirstTime, value: false, override: true);
      Get.offAllNamed(Routes.login);
    } else {
      final page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// skip onBoarding and jump to LoginScreen
  void skipPage() {
    Get.offAllNamed(Routes.login);
  }
}