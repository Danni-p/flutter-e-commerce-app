import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentCarouselIndex = 0.obs;
  
  /// Update Current Index when Page scroll
  void updatePageIndicator(index) => currentCarouselIndex.value = index;
}