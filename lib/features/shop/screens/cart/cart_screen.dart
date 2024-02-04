import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_price_text.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: DAppBar(
        title: Text(DTexts.cart, style: themeData.textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: DSizes.spaceBtwSections),
          itemCount: 4,
          itemBuilder: (_, index) => const Column(
            children: [
              DCartItem(),
              SizedBox(height: DSizes.spaceBtwItems),
              Row(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('${DTexts.checkout} \$256.0')),
      ),
    );
  }
}
