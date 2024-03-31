import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/profile/change_full_name_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/validators/validator.dart';
import 'package:iconsax/iconsax.dart';

class ChangeFullNameScreen extends StatelessWidget {
  const ChangeFullNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final changeNameController = ChangeFullNameController.instance;
    return Scaffold(

        /// Custom AppBar
        appBar: DAppBar(
          showBackArrow: true,
          title: Text('Change Name', style: themeData.textTheme.headlineSmall),
        ),
        body: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: themeData.textTheme.labelMedium,
              ),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// Texytfield and Button
              Form(
                key: changeNameController.changeFullNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: changeNameController.firstName,
                        validator: (value) => DValidator.validateEmptyText(
                            DTexts.firstName, value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: DTexts.firstName,
                            prefixIcon: Icon(Iconsax.user))),
                    const SizedBox(height: DSizes.spaceBtwInputFields),
                    TextFormField(
                        controller: changeNameController.lastName,
                        validator: (value) => DValidator.validateEmptyText(
                            DTexts.lastName, value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: DTexts.lastName,
                            prefixIcon: Icon(Iconsax.user))),
                  ],
                ),
              ),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => changeNameController.updateFullName(),
                      child: const Text(DTexts.save)))
            ],
          ),
        ));
  }
}
