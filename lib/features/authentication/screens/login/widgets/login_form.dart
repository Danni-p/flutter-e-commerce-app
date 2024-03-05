import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/login/login_controller.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DLoginForm extends StatelessWidget {
  const DLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController.instance;
    return Form(
      key: loginController.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: DSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: loginController.email,
              validator: (value) => DValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: DTexts.email),
            ),
            const SizedBox(
              height: DSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(() => TextFormField(
              controller: loginController.password,
              validator: (value) => DValidator.validatePassword(value),
              obscureText: loginController.hidePassword.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      icon: Icon(loginController.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                      onPressed: loginController.toggleHidePassword),
                  labelText: DTexts.password),
            )),
            const SizedBox(
              height: DSizes.spaceBtwInputFields / 2,
            ),

            /// Remember me & Forget Password
            Row(
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    const Text(DTexts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.toNamed(Routes.forgetPassword),
                    child: const Text(DTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => loginController.login(),
                    child: const Text(DTexts.signIn))),
            const SizedBox(height: DSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.toNamed(Routes.signup),
                    child: const Text(DTexts.createAccount)))
          ],
        ),
      ),
    );
  }
}
