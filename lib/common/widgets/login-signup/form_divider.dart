import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class DFormDivider extends StatelessWidget {
  const DFormDivider({
    super.key,
    required this.isDark,
    required this.deviderText,
  });

  final bool isDark;
  final String deviderText;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: isDark ? DColors.darkGrey : DColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(deviderText,
            style: themeData.textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: isDark ? DColors.darkGrey : DColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        )
      ],
    );
  }
}
