import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/personalization/user_data_controller.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/profile/profile_controller.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataController = UserDataController.instance;
    final profileController = ProfileController.instance;
    return Scaffold(
      appBar: const DAppBar(
        showBackArrow: true,
        title: Text(DTexts.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const DRoundedImage(
                        imageUrl: DImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text(DTexts.changeProfilePicture))
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: DSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Heading Profile Info
              const DSectionHeading(
                  title: DTexts.profileInformation, showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwItems),

              DProfileMenu(
                title: DTexts.name,
                value: userDataController.userData.value.fullName,
                onPressed: () => Get.toNamed(Routes.changeFullName),
              ),
              DProfileMenu(
                title: DTexts.userName,
                value: userDataController.userData.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: DSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Heading Personal Info
              const DSectionHeading(
                  title: DTexts.personalInformation, showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwItems),

              DProfileMenu(
                title: DTexts.userId,
                value: userDataController.userData.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              DProfileMenu(
                title: DTexts.email,
                value: userDataController.userData.value.email,
                onPressed: () {},
              ),
              DProfileMenu(
                title: DTexts.phoneNumber,
                value: userDataController.userData.value.phoneNumber,
                onPressed: () {},
              ),
              DProfileMenu(
                title: DTexts.gender,
                value: 'Male',
                onPressed: () {},
              ),
              DProfileMenu(
                title: DTexts.dateOfBirth,
                value: '10. Okt. 1994',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: DSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () =>
                        profileController.showDeleteAccountWarningPopup(),
                    child: const Text(
                      DTexts.deleteAccount,
                      style: TextStyle(color: DColors.error),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
