import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/store/store_screen.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    final isDark = DHelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
                height: 80,
                elevation: 0,
                backgroundColor: isDark ? DColors.black : DColors.white,
                indicatorColor: isDark ? DColors.white.withOpacity(0.1) : DColors.black.withOpacity(0.1),
                selectedIndex: navController.selectedIndex.value,
                onDestinationSelected: (index) =>
                    navController.selectedIndex.value = index,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Iconsax.home), label: DTexts.home),
                  NavigationDestination(
                      icon: Icon(Iconsax.shop), label: DTexts.store),
                  NavigationDestination(
                      icon: Icon(Iconsax.heart), label: DTexts.wishlist),
                  NavigationDestination(
                      icon: Icon(Iconsax.user), label: DTexts.profile)
                ])),
        body: Obx(
            () => navController.screens[navController.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.orange)
  ];
}
