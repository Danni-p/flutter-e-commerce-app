import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/product_image_slider.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/product_meta_data.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/widgets/rating_and_share.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class ProductDetaisScreen extends StatelessWidget {
  const ProductDetaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// 1 - Product Image Slider
          DProductImageSlider(),

          /// 2 - Product Details
          Padding(
            padding: EdgeInsets.only(
                right: DSizes.defaultSpace,
                left: DSizes.defaultSpace,
                bottom: DSizes.defaultSpace),
            child: Column(
              children: [
                /// - Rating & Share Button
                DRatingAndShare(),

                /// - Price, Title, Stock & Brand
                DProductMetaData(),
              ],
            ),
          )
        ],
      )),
    );
  }
}

