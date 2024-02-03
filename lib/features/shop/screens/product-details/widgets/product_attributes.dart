import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_title_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DProductAttributes extends StatelessWidget {
  const DProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        DRoundedContainer(
            padding: const EdgeInsets.all(DSizes.sm),
            backgroundColor: isDark ? DColors.darkerGrey : DColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const DSectionHeading(
                        title: DTexts.variation, showActionButton: false),
                    const SizedBox(width: DSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const DProductTitleText(
                                title: '${DTexts.price} : ', dense: true),
                            const SizedBox(width: DSizes.spaceBtwItems),

                            /// Actual Price & Sale Price
                            Text('\$25',
                                style: themeData.textTheme.titleSmall!.apply(
                                    decoration: TextDecoration.lineThrough)),
                            const SizedBox(width: DSizes.spaceBtwItems),
                            const DProductPriceText(
                              price: '20',
                              dense: true,
                            )
                          ],
                        ),

                        /// Stock
                        Row(
                          children: [
                            const DProductTitleText(
                                title: '${DTexts.stock} : ', dense: true),
                            const SizedBox(width: DSizes.spaceBtwItems),

                            /// Actual Price & Sale Price
                            Text(DTexts.inStock,
                                style: themeData.textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Variation Description
                const DProductTitleText(
                  title:
                      'This is the Description of the Product and it can go up to max 4 lines',
                  dense: true,
                  maxLines: 4,
                )
              ],
            )),
        const SizedBox(height: DSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DSectionHeading(title: DTexts.colors),
            const SizedBox(height: DSizes.spaceBtwItems / 2),
            Wrap(spacing: DSizes.spaceBtwItems, children: [
              DChoiceChip(text: 'Green', selected: true, onSelected: (flag) {}),
              DChoiceChip(text: 'Blue', selected: false, onSelected: (flag) {}),
              DChoiceChip(
                  text: 'Yellow', selected: false, onSelected: (flag) {}),
            ])
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DSectionHeading(title: DTexts.size),
            const SizedBox(height: DSizes.spaceBtwItems / 2),
            Wrap(spacing: DSizes.spaceBtwItems, children: [
              DChoiceChip(text: 'EU 34', selected: true, onSelected: (flag) {}),
              DChoiceChip(
                  text: 'EU 36', selected: false, onSelected: (flag) {}),
              DChoiceChip(
                  text: 'EU 38', selected: false, onSelected: (flag) {}),
            ])
          ],
        )
      ],
    );
  }
}
