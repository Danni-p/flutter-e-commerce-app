import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_card_horizontal.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DSubCategoryProductList extends StatelessWidget {
  const DSubCategoryProductList({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// -- Heading
      DSectionHeading(
          title: title,
          onPressed: () {},
          showActionButton: true),
      const SizedBox(height: DSizes.spaceBtwItems / 2),
    
      SizedBox(
        height: 120,
        child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) =>
                const SizedBox(width: DSizes.spaceBtwItems),
            itemBuilder: (context, index) =>
                const DProductCardHorizontal()),
      )
    ]);
  }
}
