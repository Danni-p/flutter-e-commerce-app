import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DBottomAddToCart extends StatelessWidget {
  const DBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: DSizes.defaultSpace, vertical: DSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? DColors.darkerGrey : DColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(DSizes.cardRadiusLg),
            topRight: Radius.circular(DSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DRoundedIconButton(
                icon: Iconsax.minus,
                backgroundColor: DColors.darkGrey,
                width: 40,
                height: 40,
                color: DColors.white,
                onPressed: () {},
              ),
              const SizedBox(width: DSizes.spaceBtwItems),
              Text('2', style: themeData.textTheme.titleSmall),
              const SizedBox(width: DSizes.spaceBtwItems),
              DRoundedIconButton(
                icon: Iconsax.add,
                backgroundColor: DColors.black,
                width: 40,
                height: 40,
                color: DColors.white,
                onPressed: () {},
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(DSizes.md),
                  backgroundColor: DColors.black,
                  side: const BorderSide(color: DColors.black)),
              child: const Text(DTexts.addToCart))
        ],
      ),
    );
  }
}
