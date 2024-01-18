import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DBrandCard extends StatelessWidget {
  const DBrandCard({
    super.key, this.showBorder = true,
  });

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: DRoundedContainer(
        padding: const EdgeInsets.all(DSizes.sm),
        showBorder: showBorder,
        borderColor: DColors.grey,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          /// -- Icon
          Flexible(
            child: DRoundedImage(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(DSizes.sm),
              imageUrl: DImages.clothIcon,
              isNetworkImage: false,
              backgroundColor: Colors.transparent,
              overlayColor:
                  isDark ? DColors.white : DColors.black,
            ),
          ),
          const SizedBox(
              width: DSizes.spaceBtwItems / 2),
    
          /// -- Text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const DBrandTitleWithVerifyIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large),
                Text('256 products asdsaf sdfsd',
                    overflow: TextOverflow.ellipsis,
                    style:
                        themeData.textTheme.labelMedium)
              ],
            ),
          )
        ]),
      ),
    );
  }
}