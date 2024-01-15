import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';

class DBrandTitleText extends StatelessWidget {
  const DBrandTitleText({
    super.key,
    required this.textAlign,
    required this.maxLines,
    required this.brandTextSize,
    required this.title,
    this.color,
  });

  final String title;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Text(title,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: getStyleFromTextSize(themeData: themeData, textSize: brandTextSize).apply(color: color));
  }
}

TextStyle getStyleFromTextSize(
    {required ThemeData themeData, required TextSizes textSize}) {
  switch (textSize) {
    case TextSizes.small:
      return themeData.textTheme.labelMedium!;
    case TextSizes.medium:
      return themeData.textTheme.bodyLarge!;
    case TextSizes.large:
      return themeData.textTheme.titleLarge!;
    default:
      return themeData.textTheme.bodyMedium!;
  }
}
