import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_title_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DProductMetaData extends StatelessWidget {
  const DProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          /// Sale Tag
          DRoundedContainer(
              radius: DSizes.sm,
              backgroundColor: DColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: DSizes.sm, vertical: DSizes.xs),
              child: Text('25%',
                  style: themeData.textTheme.labelLarge!
                      .apply(color: DColors.black))),
          const SizedBox(width: DSizes.spaceBtwItems),

          /// Price
          Text('\$250',
              style: themeData.textTheme.titleSmall!
                  .apply(decoration: TextDecoration.lineThrough)),
          const SizedBox(width: DSizes.spaceBtwItems),
          const DProductPriceText(price: '175', dense: false)
        ]),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Title
        const DProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const DProductTitleText(title: 'Status:'),
            const SizedBox(width: DSizes.spaceBtwItems / 2),
            Text('In Stock', style: themeData.textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            DRoundedImage(
              imageUrl: DImages.shoeIcon,
              width: 24,
              height: 24,
              overlayColor: isDark ? DColors.white : DColors.black,
            ),
            const SizedBox(width: DSizes.spaceBtwItems / 2),
            const DBrandTitleWithVerifyIcon(
                title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
