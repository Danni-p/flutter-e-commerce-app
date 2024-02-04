import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class DUserReviewCard extends StatelessWidget {
  const DUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const CircleAvatar(
                  backgroundImage: AssetImage(DImages.userProfileImage1)),
              const SizedBox(width: DSizes.spaceBtwItems),
              Text('John Doe', style: themeData.textTheme.titleLarge)
            ]),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        const SizedBox(height: DSizes.spaceBtwItems),

        /// -- Review
        const Row(children: [
          DRatingBarIndicator(rating: 4),
          SizedBox(width: DSizes.spaceBtwItems),
          Text('01 Nov, 2023')
        ]),

        const SizedBox(height: DSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and makle purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: DTexts.showLess,
          trimCollapsedText: DTexts.showMore,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: DColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: DColors.primary),
        ),

        const SizedBox(height: DSizes.spaceBtwItems),

        DRoundedContainer(
            backgroundColor: isDark ? DColors.darkerGrey : DColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(DSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Daniels Store',
                          style: themeData.textTheme.bodyLarge),
                      Text('02 Nov, 2023',
                          style: themeData.textTheme.bodyMedium)
                    ],
                  ),
                  const SizedBox(height: DSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Thanks for feedback. I really appreciate your comment. Take care!',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: DTexts.showLess,
                    trimCollapsedText: DTexts.showMore,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: DColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: DColors.primary),
                  ),
                ],
              ),
            )),
        const SizedBox(height: DSizes.spaceBtwSections),
      ],
    );
  }
}
