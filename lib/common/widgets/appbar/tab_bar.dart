import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/device/device_utils.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DTabBar(
      {super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? DColors.black : DColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: DColors.primary,
          unselectedLabelColor: DColors.darkGrey,
          labelColor: isDark ? DColors.white : DColors.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DDeviceUtils.getAppBarHeight());
}
