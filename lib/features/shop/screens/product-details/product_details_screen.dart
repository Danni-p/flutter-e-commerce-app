import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/bottom_add_to_cart.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/product_attributes.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/product_image_slider.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/product_meta_data.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/rating_and_share.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetaisScreen extends StatelessWidget {
  const ProductDetaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DBottomAddToCart(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// 1 - Product Image Slider
          const DProductImageSlider(),

          /// 2 - Product Details
          Padding(
            padding: const EdgeInsets.only(
                right: DSizes.defaultSpace,
                left: DSizes.defaultSpace,
                bottom: DSizes.defaultSpace),
            child: Column(
              children: [
                /// - Rating & Share Button
                const DRatingAndShare(),

                /// - Price, Title, Stock & Brand
                const DProductMetaData(),

                /// - Attributes
                const DProductAttributes(),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// - Checkout Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(DTexts.checkout))),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// - Description
                const DSectionHeading(title: DTexts.description),
                const SizedBox(height: DSizes.spaceBtwItems),
                const ReadMoreText(
                  'This is a Product description for Blue Nike Sleeve less vest. THere are more things that can be added but I am lazy.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: DTexts.showMore,
                  trimExpandedText: DTexts.showLess,
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),

                /// - Reviews
                const Divider(),
                const SizedBox(height: DSizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DSectionHeading(
                      title: 'Reviews (199)',
                      showActionButton: false,
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3))
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
