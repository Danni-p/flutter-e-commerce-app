import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/forget-password/forget_password_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DLoginForm extends StatelessWidget {
  const DLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: DSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: DTexts.email),
            ),
            const SizedBox(
              height: DSizes.spaceBtwInputFields,
            ),
    
            /// Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash),
                  labelText: DTexts.password),
            ),
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
                    onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                    child: const Text(DTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: DSizes.spaceBtwSections),
    
            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(DTexts.signIn))),
            const SizedBox(height: DSizes.spaceBtwItems),
    
            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(DTexts.createAccount)))
          ],
        ),
      ),
    );
  }
}