import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/loaders/shimmer_effect.dart';
import 'package:flutter_e_commerce_app/features/shop/controller/banner_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class DPromoSlider extends StatelessWidget {
  const DPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = BannerController.instance;

    return Obx(() {
      if (bannerController.isLoading.value) {
        return const DShimmerEffect(width: double.infinity, height: 190);
      }

      if (bannerController.activeBanners.isEmpty) {
        return const Center(child: Text('No data found!'));
      }

      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      bannerController.updatePageIndicator(index)),
              items: bannerController.activeBanners
                  .map((banner) => DRoundedImage(
                        width: double.infinity,
                        imageUrl: banner.imageUrl,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList()),
          const SizedBox(height: DSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < bannerController.activeBanners.length; i++)
                DRoundedContainer(
                  width: 20,
                  height: 4,
                  backgroundColor:
                      bannerController.currentCarouselIndex.value == i
                          ? DColors.primary
                          : DColors.grey,
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        ],
      );
    });
  }
}
