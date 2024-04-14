import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/asset_or_network_image.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DRoundedImage extends StatelessWidget {
  const DRoundedImage(
      {super.key,
      this.width = 55,
      this.height = 55,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.border,
      this.overlayColor,
      this.backgroundColor = Colors.transparent,
      this.fit,
      this.padding,
      this.isNetworkImage = false,
      this.onPressed,
      this.borderRadius = DSizes.md});

  final double width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? overlayColor;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: DAssetOrNetworkImage(
                imageUrl: imageUrl,
                overlayColor: overlayColor,
                fit: fit,
                width: width,
                height: height,
                isNetworkImage: isNetworkImage)),
      ),
    );
  }
}
