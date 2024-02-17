import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/tab_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/search_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: DAppBar(
          title: Text(DTexts.store, style: themeData.textTheme.headlineMedium),
          actions: [
            DCartCounterIcon(
              iconColor: isDark ? DColors.white : DColors.black,
            )
          ],
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
                            onPressed: () => Get.toNamed(Routes.allBrands),
                            showActionButton: true,
                            buttonTitle: DTexts.viewAll,
                          ),
                          const SizedBox(height: DSizes.spaceBtwItems / 1.5),

                          DGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return DBrandCard(
                                    onTap: () =>
                                        Get.toNamed(Routes.brandProducts));
                              }),
                        ],
                      ),
                    ),

                    /// -- Tabs
                    bottom: const DTabBar(tabs: [
                      Tab(
                        child: Text(DTexts.sports),
                      ),
                      Tab(
                        child: Text(DTexts.furniture),
                      ),
                      Tab(
                        child: Text(DTexts.electronics),
                      ),
                      Tab(
                        child: Text(DTexts.clothes),
                      ),
                      Tab(
                        child: Text(DTexts.cosmetics),
                      )
                    ]))
              ];
            },
            body: const TabBarView(children: [
              DCategoryTab(),
              DCategoryTab(),
              DCategoryTab(),
              DCategoryTab(),
              DCategoryTab()
            ])),
      ),
    );
  }
}
