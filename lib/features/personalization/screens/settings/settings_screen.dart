import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/primary_header_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/list-tiles/user_profile_tile.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
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
            DUserProfileTile(onPressed: () => Get.toNamed(Routes.profile)),
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
                  title: DTexts.myAddresses,
                  subtitle: 'Set shopping delivery address',
                  onTap: () => Get.toNamed(Routes.userAddress),
                ),
                DSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: DTexts.myCart,
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () => Get.toNamed(Routes.cart),
                ),
                DSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: DTexts.myOrders,
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () => Get.toNamed(Routes.order),
                ),
                DSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: DTexts.bankAccount,
                  subtitle: 'Withdraw balance to registered bank accout',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: DTexts.myCoupons,
                  subtitle: 'List of all the discounted coupons',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: DTexts.notifications,
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: DTexts.accountPrivacy,
                  subtitle: 'Manage data usage and connections',
                  onTap: () {},
                ),

                /// -- App Settings
                const SizedBox(height: DSizes.spaceBtwSections),
                const DSectionHeading(title: DTexts.appSettings),
                const SizedBox(height: DSizes.spaceBtwItems),

                DSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: DTexts.loadData,
                  subtitle: 'Upload Data to your Cloud',
                  onTap: () {},
                ),
                DSettingsMenuTile(
                    icon: Iconsax.location,
                    title: DTexts.geolocation,
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: false, onChanged: (value) {})),
                DSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: DTexts.safeMode,
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {})),
                DSettingsMenuTile(
                    icon: Iconsax.image,
                    title: DTexts.hdImageQuality,
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
