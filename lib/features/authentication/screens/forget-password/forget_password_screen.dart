import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/forget-password/forget_password_controller.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter_e_commerce_app/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = ForgetPasswordController.instance;
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: DAppBar(
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
                Form(
                  key: forgetPasswordController.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: forgetPasswordController.email,
                    validator: (value) => DValidator.validateEmail(value),
                    decoration: const InputDecoration(
                        labelText: DTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                ),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Submit Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            forgetPasswordController.sendPasswordResetEmail(),
                        child: const Text(DTexts.submit)))
              ],
            ),
          ),
        ));
  }
}
