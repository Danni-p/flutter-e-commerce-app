import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/loaders/shimmer_effect.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/personalization/user_data_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DHomeAppBar extends StatelessWidget {
  const DHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final userDataController = UserDataController.instance;
    return DAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DTexts.homeAppbarTitle,
              style:
                  themeData.textTheme.labelMedium!.apply(color: DColors.grey)),
          Obx(() {
            return userDataController.userDataLoading.value
                ? const DShimmerEffect(width: 80, height: 15)
                : Text(userDataController.userData.value.fullName,
                    style: themeData.textTheme.headlineSmall!
                        .apply(color: DColors.white));
          })
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
