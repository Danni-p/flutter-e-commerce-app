import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DLoginHeader extends StatelessWidget {
  const DLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image(
          height: 150,
          image: AssetImage(
              isDark ? DImages.lightAppLogo : DImages.darkAppLogo)),
      Text(DTexts.loginTitle,
          style: themeData.textTheme.headlineMedium),
      const SizedBox(height: DSizes.sm),
      Text(DTexts.loginSubTitle, style: themeData.textTheme.bodyMedium)
    ]);
  }
}