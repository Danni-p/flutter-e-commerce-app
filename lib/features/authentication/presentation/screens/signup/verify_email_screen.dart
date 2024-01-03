import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                icon: Icon(CupertinoIcons.clear,
                    color: isDark ? DColors.white : DColors.black))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(
                    image: const AssetImage(DImages.deliveredEmailIllustration),
                    width: DHelperFunctions.screenWidth() * 0.6),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Title & SubTitle
                Text(DTexts.confirmEmailTitle,
                    style: themeData.textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwItems),
                Text("danielpascheka@gmail.com",
                    style: themeData.textTheme.labelLarge,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwItems),
                Text(DTexts.confirmEmailSubTitle,
                    style: themeData.textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => SuccessScreen(
                            image: DImages.staticSuccessIllustration,
                            title: DTexts.yourAccountCreatedTitle,
                            subTitle: DTexts.yourAccountCreatedSubTitle,
                            primaryBtnText: DTexts.continueText,
                            onPrimaryPressed: () => Get.to(() => const LoginScreen()))),
                        child: const Text(DTexts.continueText))),
                const SizedBox(height: DSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(DTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}
