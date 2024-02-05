import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DBillingAddressSection extends StatelessWidget {
  const DBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DSectionHeading(
          title: DTexts.shippingAddress,
          buttonTitle: DTexts.change,
          showActionButton: true,
          onPressed: () {}),
      Text('Coding with T', style: themeData.textTheme.bodyLarge),
      const SizedBox(height: DSizes.spaceBtwItems / 2),

       Row(children: [
        const Icon(Icons.phone, color: DColors.grey, size: 16),
        const SizedBox(width: DSizes.spaceBtwItems),
        Text('+92-317-8059525', style: themeData.textTheme.bodyMedium),
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2),

      Row(children: [
        const Icon(Icons.location_history, color: DColors.grey, size: 16),
        const SizedBox(width: DSizes.spaceBtwItems),
        Expanded(child: Text('South Liana, Maine 87695, USA', style: themeData.textTheme.bodyMedium, softWrap: true,)),
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2)
    ]);
  }
}
