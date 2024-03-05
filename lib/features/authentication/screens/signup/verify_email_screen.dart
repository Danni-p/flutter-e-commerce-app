import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/signup/verify_email_controller.dart';
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
    final email = Get.arguments['email'] as String?;
    final password = Get.arguments['password'] as String?;
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    final controller = VerifyEmailController.instance;
    final authRepository = AuthRepository.instance;

    return Scaffold(
        appBar: DAppBar(
          actions: [
            IconButton(
                onPressed: () => authRepository.logout(),
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
                Text(email ?? '',
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
                        onPressed: () =>
                            controller.redirectToSuccessIfConfirmed(
                                email: email ?? '', password: password ?? ''),
                        child: const Text(DTexts.signIn))),
                const SizedBox(height: DSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () => controller.sendEmailVerification(
                            email: email ?? ''),
                        child: const Text(DTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}
