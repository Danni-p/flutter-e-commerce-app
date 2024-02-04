import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DOverallProductRating extends StatelessWidget {
  const DOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(right: DSizes.spaceBtwItems),
        child: Text('4.8', style: themeData.textTheme.displayLarge),
      ),
      const Expanded(
        child: Column(
          children: [
            DRatingProgressIndicator(text: '5', value: 1.0),
            DRatingProgressIndicator(text: '4', value: 0.8),
            DRatingProgressIndicator(text: '3', value: 0.6),
            DRatingProgressIndicator(text: '2', value: 0.4),
            DRatingProgressIndicator(text: '1', value: 0.2)
          ],
        ),
      )
    ]);
  }
}
