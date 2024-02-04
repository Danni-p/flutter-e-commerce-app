import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DHomeAppBar extends StatelessWidget {
  const DHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return DAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DTexts.homeAppbarTitle,
              style:
                  themeData.textTheme.labelMedium!.apply(color: DColors.grey)),
          Text(DTexts.homeAppbarSubTitle,
              style: themeData.textTheme.headlineSmall!
                  .apply(color: DColors.white))
        ],
      ),
      actions: const [
        DCartCounterIcon(
          iconColor: DColors.white,
        )
      ],
    );
  }
}
