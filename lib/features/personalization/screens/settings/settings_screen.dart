import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/primary_header_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/list-tiles/user_profile_tile.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/address/user_address_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// -- Header
          DPrimaryHeaderContainer(
              child: Column(children: [
            DAppBar(
                title: Text(DTexts.account,
                    style: themeData.textTheme.headlineMedium!
                        .apply(color: DColors.white))),

            /// User Profile Card
            DUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
            const SizedBox(height: DSizes.spaceBtwSections),
          ])),

          /// -- Body
          Padding(
            padding: const EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Account Settings
                const DSectionHeading(title: DTexts.accountSettings),
                const SizedBox(height: DSizes.spaceBtwItems),

                DSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subtitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                DSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to registered bank accout',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subtitle: 'List of all the discounted coupons',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connections',
                  onTap: () {},
                ),

                /// -- App Settings
                const SizedBox(height: DSizes.spaceBtwSections),
                const DSectionHeading(title: DTexts.appSettings),
                const SizedBox(height: DSizes.spaceBtwItems),

                DSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Load Data',
                  subtitle: 'Upload Data to your Cloud',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: false, onChanged: (value) {})),
                DSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {})),
                DSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {})),

                /// -- Logout Button
                const SizedBox(height: DSizes.spaceBtwSections),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text(DTexts.logout))),
                const SizedBox(height: DSizes.spaceBtwSections * 2.5),
              ],
            ),
          )
        ],
      )),
    );
  }
}
