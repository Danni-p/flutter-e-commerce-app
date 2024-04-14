import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/loaders/shimmer_effect.dart';

class DAssetOrNetworkImage extends StatelessWidget {
  const DAssetOrNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.overlayColor,
      required this.fit,
      required this.width,
      required this.height,
      this.isNetworkImage = false});

  final String imageUrl;
  final Color? overlayColor;
  final BoxFit? fit;
  final double width;
  final double height;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            color: overlayColor,
            fit: fit,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                DShimmerEffect(width: width, height: height),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : Image(image: AssetImage(imageUrl), color: overlayColor, fit: fit);
  }
}