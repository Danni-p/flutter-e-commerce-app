import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_title_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DProductCardHorizontal extends StatelessWidget {
  const DProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.productDetails),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DSizes.productImageRadius),
            color: isDark ? DColors.darkerGrey : DColors.lightContainer),
        child: Row(children: [
          /// -- Thumbnail
          DRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(DSizes.sm),
              backgroundColor: isDark ? DColors.dark : DColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: DRoundedImage(
                        imageUrl: DImages.productImage1,
                        applyImageRadius: true),
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 0,
                    child: DRoundedContainer(
                      radius: DSizes.sm,
                      backgroundColor: DColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: DSizes.sm, vertical: DSizes.xs),
                      child: Text(
                        '25%',
                        style: themeData.textTheme.labelLarge!
                            .apply(color: DColors.black),
                      ),
                    ),
                  ),

                  /// -- Favourite Icon
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: DRoundedIconButton(
                          icon: Iconsax.heart5, color: Colors.red))
                ],
              )),

          /// -- Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: DSizes.sm, left: DSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        dense: true,
                      ),
                      SizedBox(height: DSizes.spaceBtwItems / 2),
                      DBrandTitleWithVerifyIcon(title: 'Nike')
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// -- Pricing
                      const Flexible(child: DProductPriceText(price: '256.0', dense: true,)),

                      /// -- Add to cart
                      Container(
                        decoration: const BoxDecoration(
                            color: DColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(DSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    DSizes.productImageRadius))),
                        child: const SizedBox(
                            width: DSizes.iconLg * 1.2,
                            height: DSizes.iconLg * 1.2,
                            child:
                                Center(child: Icon(Iconsax.add, color: DColors.white))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
