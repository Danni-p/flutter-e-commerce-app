import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/curved-edges/curved_edges_widget.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DProductImageSlider extends StatelessWidget {
  const DProductImageSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return DCurvedEdgesWidget(
        child: Container(
      color: isDark ? DColors.darkerGrey : DColors.light,
      child: Stack(children: [
        /// Main Large Image
        const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(DSizes.productImageRadius),
              child: Center(
                  child: Image(image: AssetImage(DImages.productImage1))),
            )),
    
        /// Image Slider
        Positioned(
          right: 0,
          bottom: 30,
          left: DSizes.defaultSpace,
          child: SizedBox(
            height: 80,
            child: ListView.separated(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(
                width: DSizes.spaceBtwItems,
              ),
              itemBuilder: (_, index) => DRoundedImage(
                  width: 80,
                  imageUrl: DImages.productImage1,
                  backgroundColor: isDark ? DColors.dark : DColors.white,
                  border: Border.all(color: DColors.primary)),
            ),
          ),
        ),
    
        /// Appbar Icons
        const DAppBar(
          showBackArrow: true,
          actions: [
            DRoundedIconButton(icon: Iconsax.heart5, color: DColors.error)
          ],
        )
      ]),
    ));
  }
}