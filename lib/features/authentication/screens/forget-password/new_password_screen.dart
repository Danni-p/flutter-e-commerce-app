import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/forget-password/new_password_controller.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter_e_commerce_app/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = NewPasswordController.instance;
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
                Text(DTexts.enterPasswordTitle,
                    style: themeData.textTheme.headlineMedium),
                const SizedBox(height: DSizes.spaceBtwSections),
                Text(DTexts.enterPasswordSubTitle,
                    style: themeData.textTheme.labelMedium),
                const SizedBox(height: DSizes.spaceBtwSections * 2),

                /// Text Field
                Form(
                  key: newPasswordController.newPasswordFormKey,
                  child: Obx(() => TextFormField(
                    controller: newPasswordController.password,
                    obscureText: newPasswordController.hidePassword.value,
                    validator: (value) => DValidator.validatePassword(value),
                    decoration: InputDecoration(
                  labelText: DTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: newPasswordController.toggleHidePassword,
                      icon: Icon(newPasswordController.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
                  ),
                )),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Submit Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            newPasswordController.resetPassword(),
                        child: const Text(DTexts.submit)))
              ],
            ),
          ),
        ));
  }
}
