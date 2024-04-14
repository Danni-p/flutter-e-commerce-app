import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/device/device_utils.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DSizes.md),
      child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => leadingOnPressed!= null ? leadingOnPressed!() : Get.back(),
                  icon: Icon(Iconsax.arrow_left, color: isDark ? DColors.white : DColors.black))
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed, icon: Icon(leadingIcon, color: isDark ? DColors.white : DColors.black))
                  : null,
          title: title,
          actions: actions),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DDeviceUtils.getAppBarHeight());
}
