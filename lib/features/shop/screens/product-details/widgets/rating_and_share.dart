import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class DRatingAndShare extends StatelessWidget {
  const DRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      /// Rating
      Row(children: [
        const Icon(Iconsax.star5, color: DColors.secondary, size: 24),
        const SizedBox(width: DSizes.spaceBtwItems / 2),
        Text.rich(TextSpan(children: [
          TextSpan(text: '5.0 ', style: themeData.textTheme.bodyLarge),
          const TextSpan(text: '(199)')
        ]))
      ]),
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.share, size: DSizes.iconMd))
    ]);
  }
}
