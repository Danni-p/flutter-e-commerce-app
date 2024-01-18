import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DBrandShowcase extends StatelessWidget {
  const DBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return DRoundedContainer(
      showBorder: true,
      borderColor: DColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
      padding: const EdgeInsets.all(DSizes.md),
      child: Column(children: [
        /// Brand with Products Count
        const DBrandCard(showBorder: false),

        /// Brand Top 3 Product Images
        Row(
          children: images
              .map((imageUrl) => brandTopProductImageWidget(imageUrl, context))
              .toList(),
        )
      ]),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return Expanded(
      child: DRoundedContainer(
        height: 100,
        backgroundColor: isDark ? DColors.darkerGrey : DColors.light,
        margin: const EdgeInsets.symmetric(horizontal: DSizes.sm / 2),
        padding: const EdgeInsets.all(DSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
