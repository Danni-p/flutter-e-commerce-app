import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: DAppBar(title: Text('Nike'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              children: [
                DBrandCard(),
                SizedBox(height: DSizes.spaceBtwSections),
                DSortableProducts(),
              ],
            ),
          ),
        ));
  }
}
