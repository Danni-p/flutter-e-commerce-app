import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/styles/spacing_styles.dart';
import 'package:flutter_e_commerce_app/common/widgets/login-signup/form_divider.dart';
import 'package:flutter_e_commerce_app/common/widgets/login-signup/social_buttons.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/login/widgets/login_form.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/login/widgets/login_header.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: DSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            /// Logo, Title
            const DLoginHeader(),

            /// Form
            const DLoginForm(),

            /// Divider
            DFormDivider(deviderText: DTexts.orSignInWith.capitalize!),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Footer
            const DSocialButtons()
          ]),
        ),
      ),
    );
  }
}
