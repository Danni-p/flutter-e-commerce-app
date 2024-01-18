import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DCartCounterIcon extends StatelessWidget {
  const DCartCounterIcon({
    super.key,
    this.iconColor = DColors.white,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: isDark ? DColors.darkerGrey : DColors.dark, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text('2',
                  style: themeData.textTheme.labelLarge!
                      .apply(color: DColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
