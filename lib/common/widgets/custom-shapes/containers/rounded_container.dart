import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DRoundedContainer extends StatelessWidget {
  const DRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = DSizes.cardRadiusLg,
    this.padding,
    this.showBorder = false,
    this.margin,
    this.child,
    this.backgroundColor,
    this.borderColor = DColors.borderPrimary
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final Color borderColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor),
      child: child,
    );
  }
}