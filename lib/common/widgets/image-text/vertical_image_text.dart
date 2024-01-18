import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DVerticalImageText extends StatelessWidget {
  const DVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = DColors.white,
    this.backgroundColor = DColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(DSizes.spaceBtwItems),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          /// Circular Icon
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(DSizes.sm),
            decoration: BoxDecoration(
                color:
                    backgroundColor ?? (isDark ? DColors.black : DColors.white),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover)),
          ),
          const SizedBox(height: DSizes.spaceBtwItems / 2),
          SizedBox(
            width: 56,
            child: Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor)),
          )
        ]),
      ),
    );
  }
}
