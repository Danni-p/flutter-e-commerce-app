import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/sub-categories/widgets/sub_category_product_list.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(children: [
            /// -- Banner
            DRoundedImage(
                imageUrl: DImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true),
            SizedBox(height: DSizes.spaceBtwSections),

            /// -- Sub-Categories
            DSubCategoryProductList(title: 'Sports shirts')
          ]),
        ),
      ),
    );
  }
}

