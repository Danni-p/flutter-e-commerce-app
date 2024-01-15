import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_text.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class DBrandTitleWithVerifyIcon extends StatelessWidget {
  const DBrandTitleWithVerifyIcon(
      {super.key,
      required this.title,
      this.iconColor = DColors.primary,
      this.textColor,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final Color? textColor;
  final Color iconColor;
  final String title;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      DBrandTitleText(
          textAlign: textAlign,
          maxLines: maxLines,
          brandTextSize: brandTextSize,
          title: 'Nike',
          color: textColor),
      const SizedBox(width: DSizes.xs),
      Icon(Iconsax.verify5, color: iconColor, size: DSizes.iconXs)
    ]);
  }
}
