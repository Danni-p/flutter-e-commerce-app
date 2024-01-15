import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/search_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: DAppBar(
        title: Text(DTexts.store, style: themeData.textTheme.headlineMedium),
        actions: [DCartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? DColors.black : DColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(DSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- SearchBar
                      const SizedBox(height: DSizes.spaceBtwItems),
                      const DSearchContainer(
                        text: DTexts.searchInStore,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: DSizes.spaceBtwSections),

                      /// -- Featured Brands
                      DSectionHeading(
                        title: DTexts.featuredBrands,
                        onPressed: () {},
                        showActionButton: true,
                        buttonTitle: DTexts.viewAll,
                      ),
                      const SizedBox(height: DSizes.spaceBtwItems / 1.5),

                      DGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: DRoundedContainer(
                                padding: const EdgeInsets.all(DSizes.sm),
                                showBorder: true,
                                borderColor: DColors.grey,
                                backgroundColor: Colors.transparent,
                                child: Row(children: [
                                  /// -- Icon
                                  Flexible(
                                    child: DRoundedImage(
                                      width: 56,
                                      height: 56,
                                      padding: const EdgeInsets.all(DSizes.sm),
                                      imageUrl: DImages.clothIcon,
                                      isNetworkImage: false,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          isDark ? DColors.white : DColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: DSizes.spaceBtwItems / 2),

                                  /// -- Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const DBrandTitleWithVerifyIcon(
                                            title: 'Nike',
                                            brandTextSize: TextSizes.large),
                                        Text('256 products asdsaf sdfsd',
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                themeData.textTheme.labelMedium)
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
