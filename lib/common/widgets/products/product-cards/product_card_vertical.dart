import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/styles/shadows.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_title_text.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DProductCardVertical extends StatelessWidget {
  const DProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [DShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(DSizes.productImageRadius),
            color: isDark ? DColors.darkerGrey : DColors.white),
        child: Column(children: [
          /// Thumbnail, Wishlist Button, Discount Tag
          DRoundedContainer(
            height: 180,
            padding: const EdgeInsets.symmetric(
                horizontal: DSizes.sm, vertical: DSizes.xs),
            backgroundColor: isDark ? DColors.dark : DColors.light,
            child: Stack(children: [
              /// -- Thumbnail image
              const DRoundedImage(
                  imageUrl: DImages.productImage1, applyImageRadius: true),

              /// -- Sale Tag
              Positioned(
                top: 12,
                child: DRoundedContainer(
                  radius: DSizes.sm,
                  padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.sm, vertical: DSizes.xs),
                  backgroundColor: DColors.secondary.withOpacity(0.8),
                  child: Text('25%',
                      style: themeData.textTheme.labelLarge!
                          .apply(color: DColors.black)),
                ),
              ),

              /// -- Favourite Icon Button
              Positioned(
                top: 0,
                right: 0,
                child: DRoundedIconButton(
                    icon: Iconsax.heart5,
                    color: DColors.error,
                    onPressed: () {}),
              ),
            ]),
          ),

          /// -- Details
          Padding(
            padding: const EdgeInsets.only(left: DSizes.sm),
            child: Column(
              children: [
                const DProductTitleText(
                    title: 'Green Nike Air Shoes', dense: true),
                const SizedBox(
                  height: DSizes.spaceBtwItems / 2,
                ),
                Row(children: [
                  Text('Nike',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: themeData.textTheme.labelMedium),
                  const SizedBox(width: DSizes.xs),
                  const Icon(Iconsax.verify5,
                      color: DColors.primary, size: DSizes.iconXs)
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const DProductPriceText(price: '35.5'),
                      Container(
                        decoration: const BoxDecoration(
                            color: DColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(DSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    DSizes.productImageRadius))),
                        child: const Center(
                            child: SizedBox(
                                width: DSizes.iconLg,
                                height: DSizes.iconLg,
                                child:
                                    Icon(Iconsax.add, color: DColors.white))),
                      )
                    ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

