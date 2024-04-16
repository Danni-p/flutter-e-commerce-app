import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/brands/brand_showcase.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_card_vertical.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/domain/entities/category.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DCategoryTab extends StatelessWidget {
  const DCategoryTab({
    super.key, required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, 
    
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(children: [
          /// -- Brands
          const DBrandShowcase(images: [
            DImages.productImage3,
            DImages.productImage4,
            DImages.productImage5
          ]),

          /// -- Products
          DSectionHeading(
            title: DTexts.youMightLike,
            showActionButton: true,
            onPressed: () {},
          ),
          const SizedBox(height: DSizes.spaceBtwItems),

          DGridLayout(
              itemCount: 4,
              mainAxisExtent: 240,
              itemBuilder: (_, index) => const DProductCardVertical())
        ]),
      ),
    ]);
  }
}
