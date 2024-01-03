import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/styles/spacing_styles.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: DSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            /// Image
            Image(
                image: AssetImage(image),
                width: DHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Title & SubTitle
            Text(title,
                style: themeData.textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: DSizes.spaceBtwItems),
            Text(subTitle,
                style: themeData.textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(DTexts.continueText))),
          ]),
        ),
      ),
    );
  }
}
