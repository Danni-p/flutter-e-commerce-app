import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.themeData,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final ThemeData themeData;
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: DHelperFunctions.screenWidth() * 0.8,
              height: DHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(title,
              style: themeData.textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: DSizes.spaceBtwItems),
          Text(subtitle,
              style: themeData.textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}