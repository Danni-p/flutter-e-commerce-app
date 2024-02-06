import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DOrderItem extends StatelessWidget {
  const DOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return DRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(DSizes.md),
      borderColor: DColors.light,
      backgroundColor: isDark ? DColors.dark : DColors.light,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        /// -- Row 1
        Row(children: [
          /// -- 1. Icon
          const Icon(Iconsax.ship),
          const SizedBox(width: DSizes.spaceBtwItems / 2),

          /// -- 2. Status & Date
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DTexts.processing,
                      style: themeData.textTheme.bodyLarge!
                          .apply(color: DColors.primary, fontWeightDelta: 1)),
                  Text('07 Nov 2024', style: themeData.textTheme.headlineSmall)
                ]),
          ),

          /// -- 3. Icon
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.arrow_right_34,
                size: DSizes.iconSm,
              ))
        ]),

        const SizedBox(height: DSizes.spaceBtwItems),

        /// -- Row 2
        Row(
          children: [
            Expanded(
              child: Row(children: [
                /// -- 1. Icon
                const Icon(Iconsax.tag),
                const SizedBox(width: DSizes.spaceBtwItems / 2),

                /// -- 2. Status & Date
                Expanded(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DTexts.order,
                            style: themeData.textTheme.labelMedium),
                        Text('#25864', style: themeData.textTheme.titleMedium)
                      ]),
                ),
              ]),
            ),
            Expanded(
              child: Row(children: [
                /// -- 1. Icon
                const Icon(Iconsax.calendar),
                const SizedBox(width: DSizes.spaceBtwItems / 2),

                /// -- 2. Status & Date
                Expanded(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DTexts.shippingDate,
                            style: themeData.textTheme.labelMedium),
                        Text('03. Feb 2024',
                            style: themeData.textTheme.titleMedium)
                      ]),
                ),
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
