import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DSocialButtons extends StatelessWidget {
  const DSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: DColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: DSizes.iconMd,
              height: DSizes.iconMd,
              image: AssetImage(DImages.google),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: DSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: DColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: DSizes.iconMd,
              height: DSizes.iconMd,
              image: AssetImage(DImages.facebook),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}