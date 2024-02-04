import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DProductQuantityWithAddRemoveButton extends StatelessWidget {
  const DProductQuantityWithAddRemoveButton({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        DRoundedIconButton(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: DSizes.md,
          color: isDark ? DColors.white : DColors.black,
          backgroundColor: isDark ? DColors.darkerGrey : DColors.light,
        ),
        const SizedBox(width: DSizes.spaceBtwItems),
        Text('2', style: themeData.textTheme.titleSmall),
        const SizedBox(width: DSizes.spaceBtwItems),
        const DRoundedIconButton(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: DSizes.md,
          color: DColors.white,
          backgroundColor: DColors.primary,
        ),
      ],
    );
  }
}
