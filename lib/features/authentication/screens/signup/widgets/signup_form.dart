import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/signup/signup_controller.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DSignupForm extends StatelessWidget {
  const DSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = SignupController.instance;
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signupController.firstName,
                  validator: (value) =>
                      DValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                      labelText: DTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: DSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: signupController.lastName,
                  validator: (value) =>
                      DValidator.validateEmptyText('Last Name', value),
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
            controller: signupController.username,
            validator: (value) =>
                DValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
                labelText: DTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: signupController.email,
            validator: (value) => DValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: DTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: signupController.phoneNumber,
            validator: (value) => DValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: DTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: signupController.password,
              validator: (value) => DValidator.validatePassword(value),
              obscureText: signupController.hidePassword.value,
              decoration: InputDecoration(
                  labelText: DTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: signupController.toggleHidePassword,
                      icon: Icon(signupController.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
          ),
          const SizedBox(height: DSizes.spaceBtwSections),

          /// Terms & Conditions Checkbox
          const DTermsAndConditionsCheckbox(),
          const SizedBox(height: DSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => signupController.signup(),
                child: const Text(DTexts.createAccount),
              )),
        ],
      ),
    );
  }
}
