import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/application/controller/on_boarding_controller.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/on-boarding/widgets/on_boarding_navigation.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/on-boarding/widgets/on_boarding_next_button.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/on-boarding/widgets/on_boarding_page.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/on-boarding/widgets/on_boarding_skip.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final onBoardingController = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(children: [
        /// Horizontal Scrollable Pages
        PageView(
          controller: onBoardingController.pageController,
          onPageChanged: (index) => onBoardingController.updatePageIndicator(index),
          children: [
            OnBoardingPage(
                themeData: themeData,
                image: DImages.onBoardingImage1,
                title: DTexts.onBoardingTitle1,
                subtitle: DTexts.onBoardingSubTitle1),
            OnBoardingPage(
                themeData: themeData,
                image: DImages.onBoardingImage2,
                title: DTexts.onBoardingTitle2,
                subtitle: DTexts.onBoardingSubTitle2),
            OnBoardingPage(
                themeData: themeData,
                image: DImages.onBoardingImage3,
                title: DTexts.onBoardingTitle3,
                subtitle: DTexts.onBoardingSubTitle3)
          ],
        ),

        /// Skip Button
        const OnBoardingSkip(),

        /// Dot Navigation SmoothPageIndicator
        const OnBoardingNavigation(),

        /// Circular Button
        const OnBoardingNextButton()
      ]),
    );
  }
}


