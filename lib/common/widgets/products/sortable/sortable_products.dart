import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_card_vertical.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class DSortableProducts extends StatelessWidget {
  const DSortableProducts({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        /// -- Dropdown
        DropdownButtonFormField(
            decoration:
                const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option))).toList(),
            onChanged: (value) {}),
            const SizedBox(height: DSizes.spaceBtwSections),
            /// -- Products
            DGridLayout(
              mainAxisExtent: 240,
              itemCount: 4, itemBuilder: (_, index) => const DProductCardVertical())
      ],
    );
  }
}