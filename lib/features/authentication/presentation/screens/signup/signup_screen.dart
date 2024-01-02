import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/login-signup/form_divider.dart';
import 'package:flutter_e_commerce_app/common/widgets/login-signup/social_buttons.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/signup/widgets/signup_form.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(DSizes.defaultSpace),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(DTexts.signUpTitle,
                          style: themeData.textTheme.headlineMedium),
                      const SizedBox(height: DSizes.spaceBtwSections),

                      /// Form
                      const DSignupForm(),

                      const SizedBox(height: DSizes.spaceBtwSections),

                      /// Divider
                      DFormDivider(
                          isDark: isDark,
                          deviderText: DTexts.orSignUpWith.capitalize!),
                      const SizedBox(height: DSizes.spaceBtwSections),

                      /// Footer
                      const DSocialButtons()
                    ]))));
  }
}
