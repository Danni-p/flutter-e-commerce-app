import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/on_boarding_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/device/device_utils.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = DHelperFunctions.isDarkMode(context);
    
    return Positioned(
        bottom: DDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: DSizes.defaultSpace,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
                activeDotColor: isDark ? DColors.light : DColors.dark, dotHeight: 6),
            controller: controller.pageController,
            onDotClicked: (index) => controller.dotNavigationClick(index),
            count: 3));
  }
}