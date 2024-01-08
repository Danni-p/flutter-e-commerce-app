import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/device/device_utils.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DSearchContainer extends StatelessWidget {
  const DSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
      child: Container(
        width: DDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(DSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? isDark
                    ? DColors.black
                    : DColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(DSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: DColors.grey) : null),
        child: Row(children: [
          Icon(icon, color: DColors.darkerGrey),
          const SizedBox(width: DSizes.spaceBtwItems),
          Text(text, style: themeData.textTheme.bodySmall)
        ]),
      ),
    );
  }
}