import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-reviews/widgets/overall_product_rating.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-reviews/widgets/user_review_card.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return  Scaffold(
      appBar: const DAppBar(
          title: Text(DTexts.reviewsAndRatings), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(DTexts.ratingDescription),
            const SizedBox(height: DSizes.spaceBtwItems),
            const DOverallProductRating(),
            const DRatingBarIndicator(rating: 4.5),
            Text('12,611', style: themeData.textTheme.bodySmall),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// -- User Reviews List
            const DUserReviewCard()
          ]),
        ),
      ),
    );
  }
}

