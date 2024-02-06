import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DCartItems extends StatelessWidget {
  const DCartItems({
    super.key,
    this.showAddRemoveButtons = true,
    this.scrollable = true
  });

  final bool showAddRemoveButtons;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) =>
          const SizedBox(height: DSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          const DCartItem(),
          if (showAddRemoveButtons) ...[
            const SizedBox(height: DSizes.spaceBtwItems),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 75),

                    /// -- Add, Remove Buttons
                    DProductQuantityWithAddRemoveButton(),
                  ],
                ),
                DProductPriceText(
                  price: '256',
                  dense: true,
                )
              ],
            )
          ]
        ],
      ),
    );
  }
}
