import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_title_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DCartItem extends StatelessWidget {
  const DCartItem({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Column(children: [
      Row(
        children: [
          DRoundedImage(
            imageUrl: DImages.productImage1,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(DSizes.sm),
            backgroundColor: isDark ? DColors.darkerGrey : DColors.light,
          ),
          const SizedBox(width: DSizes.spaceBtwItems),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DBrandTitleWithVerifyIcon(title: 'Nike'),
                const Flexible(
                    child: DProductTitleText(
                        title: 'Black Sports shoes', maxLines: 1)),
    
                /// -- Attributes
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Color ',
                      style: themeData.textTheme.bodySmall),
                  TextSpan(
                      text: 'Green ',
                      style: themeData.textTheme.bodySmall),
                  TextSpan(
                      text: 'Size ',
                      style: themeData.textTheme.bodySmall),
                  TextSpan(
                      text: 'UK08 ',
                      style: themeData.textTheme.bodySmall),
                ]))
              ],
            ),
          )
        ],
      )
    ]);
  }
}
