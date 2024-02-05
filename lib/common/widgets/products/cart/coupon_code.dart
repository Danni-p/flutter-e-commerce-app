
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DCouponCode extends StatelessWidget {
  const DCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return DRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? DColors.dark : DColors.white,
      padding: const EdgeInsets.only(
          top: DSizes.sm, bottom: DSizes.sm, right: DSizes.sm, left: DSizes.md),
      child: Row(children: [
        /// -- TextField
        Flexible(
            child: TextFormField(
          decoration: const InputDecoration(
              hintText: DTexts.couponText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none),
        )),

        /// -- Button
        SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? DColors.white.withOpacity(0.5)
                    : DColors.dark.withOpacity(0.5),
                backgroundColor: DColors.grey.withOpacity(0.1),
                side: BorderSide(color: DColors.grey.withOpacity(0.1))),
            child: const Text(DTexts.apply),
          ),
        )
      ]),
    );
  }
}