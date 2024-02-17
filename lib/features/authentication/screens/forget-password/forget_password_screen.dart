import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.offAllNamed(Routes.login),
                icon: Icon(CupertinoIcons.clear,
                    color: isDark ? DColors.white : DColors.black))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Headings
                Text(DTexts.forgetPasswordTitle,
                    style: themeData.textTheme.headlineMedium),
                const SizedBox(height: DSizes.spaceBtwSections),
                Text(DTexts.forgetPasswordSubTitle,
                    style: themeData.textTheme.labelMedium),
                const SizedBox(height: DSizes.spaceBtwSections * 2),

                /// Text Field
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: DTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Submit Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            Get.off(() => const SuccessScreen(), arguments: {
                              'image': DImages.staticSuccessIllustration,
                              'title': DTexts.changeYourPasswordTitle,
                              'subTitle': DTexts.changeYourPasswordSubTitle,
                              'onPrimaryPressed': () => Get.back(),
                              'primaryBtnText': DTexts.done,
                              'secondaryBtnText': DTexts.resendEmail,
                              'onSecondaryPressed': () {}
                            }),
                        child: const Text(DTexts.submit)))
              ],
            ),
          ),
        ));
  }
}
