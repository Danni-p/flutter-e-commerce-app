import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/image-text/vertical_image_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/loaders/category_shimmer.dart';
import 'package:flutter_e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:get/get.dart';

class DHomeCategories extends StatelessWidget {
  const DHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const DCategoryShimmer();
      } else if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No Data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: DColors.white)));
      } else {
        return SizedBox(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return DVerticalImageText(
                  title: category.name,
                  image: category.image,
                  onTap: () => Get.toNamed(Routes.subCategories),
                );
              }),
        );
      }
    });
  }
}
