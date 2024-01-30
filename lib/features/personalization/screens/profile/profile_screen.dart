import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                value: 'Coding with T',
                onPressed: () {},
              ),
              DProfileMenu(
                title: DTexts.userName,
                value: 'coding_with_t',
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
                value: '123987',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              DProfileMenu(
                title: DTexts.email,
                value: 'danielpascheka@web.de',
                onPressed: () {},
              ),
              DProfileMenu(
                title: DTexts.phoneNumber,
                value: '0123 456 7890',
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
                child: TextButton(onPressed: () {}, child: const Text(DTexts.closeAccount, style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
