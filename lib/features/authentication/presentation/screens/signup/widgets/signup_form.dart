import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/signup/verify_email_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/presentation/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DSignupForm extends StatelessWidget {
  const DSignupForm({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: DTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                  width: DSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: DTexts.lasstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),
    
          /// Username
          TextFormField(
            decoration: const InputDecoration(
                labelText: DTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),
    
          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: DTexts.email,
                prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),
    
          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
                labelText: DTexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),
    
          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                labelText: DTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: DSizes.spaceBtwSections),
    
          /// Terms & Conditions Checkbox
          const DTermsAndConditionsCheckbox(),
          const SizedBox(height: DSizes.spaceBtwSections),
    
          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(DTexts.createAccount),
              )),
        ],
      ),
    );
  }
}
