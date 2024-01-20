import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/icons/rounded_icon_button.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/product-cards/product_card_vertical.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: DAppBar(
        title: Text(DTexts.wishlist, style: themeData.textTheme.headlineMedium),
        actions: [
          DRoundedIconButton(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              DGridLayout(
                  itemCount: 4,
                  mainAxisExtent: 240,
                  itemBuilder: (_, index) => const DProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
