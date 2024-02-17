import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/primary_header_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/search_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_card_vertical.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const DPrimaryHeaderContainer(
                child: Column(
              children: [
                /// AppBar
                DHomeAppBar(),
                SizedBox(height: DSizes.spaceBtwSections),

                /// Searchbar
                DSearchContainer(
                    text: DTexts.storeSearch,
                    padding:
                        EdgeInsets.symmetric(horizontal: DSizes.defaultSpace)),
                SizedBox(height: DSizes.spaceBtwSections),

                /// Categories
                Padding(
                    padding: EdgeInsets.only(left: DSizes.defaultSpace),
                    child: Column(children: [
                      /// Heading
                      DSectionHeading(
                        title: DTexts.popularCategories,
                        textColor: DColors.white,
                      ),
                      SizedBox(height: DSizes.spaceBtwItems),

                      /// Categories
                      DHomeCategories(),
                      SizedBox(height: DSizes.spaceBtwSections),
                    ]))
              ],
            )),

            /// Body - Content
            Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpace),
              child: Column(
                children: [
                  const DPromoSlider(imageUrls: [
                    DImages.banner1,
                    DImages.banner2,
                    DImages.banner3
                  ]),
                  const SizedBox(height: DSizes.spaceBtwSections),

                  /// -- Heading
                  DSectionHeading(
                      title: DTexts.popularProducts,
                      onPressed: () => Get.toNamed(Routes.allProducts),
                      showActionButton: true),
                  const SizedBox(height: DSizes.spaceBtwItems),

                  /// -- Popular Products
                  DGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 240,
                    itemBuilder: (context, index) =>
                        const DProductCardVertical(),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
