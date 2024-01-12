import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DRoundedIconButton extends StatelessWidget {
  const DRoundedIconButton({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : isDark
                ? DColors.black.withOpacity(0.9)
                : DColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed,
          color: color,
          icon: Icon(
            icon,
            size: size,
          )),
    );
  }
}
