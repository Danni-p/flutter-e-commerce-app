import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DBillingPaymentSection extends StatelessWidget {
  const DBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Column(
      children: [
        DSectionHeading(
          title: DTexts.paymentMethod,
          buttonTitle: DTexts.change,
          showActionButton: true,
          onPressed: () {},
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),
        Row(children: [
          DRoundedContainer(
            width: 60,
            height: 35,
            backgroundColor: isDark ? DColors.black : DColors.white,
            padding: const EdgeInsets.all(DSizes.sm),
            child: const Image(image: AssetImage(DImages.paypal), fit: BoxFit.contain),
          ),
          const SizedBox(width: DSizes.spaceBtwItems / 2),
          Text(DTexts.paypal, style: themeData.textTheme.bodyLarge)
        ],)
      ],
    );
  }
}
