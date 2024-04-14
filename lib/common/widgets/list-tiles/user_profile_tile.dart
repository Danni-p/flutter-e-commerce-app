import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/common/widgets/loaders/shimmer_effect.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/personalization/user_data_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class DUserProfileTile extends StatelessWidget {
  const DUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final userDataController = UserDataController.instance;
    return ListTile(
      leading: Obx(() => userDataController.imageUploading.value
          ? const DShimmerEffect(width: 50, height: 50)
          : DRoundedImage(
              imageUrl: userDataController.getImageUrlOrDefault(),
              width: 50,
              height: 50,
              isNetworkImage:
                  userDataController.userData.value.hasProfilePicture,
            )),
      title: Text(userDataController.userData.value.fullName,
          style:
              themeData.textTheme.headlineSmall!.apply(color: DColors.white)),
      subtitle: Text(userDataController.userData.value.email,
          style: themeData.textTheme.bodyMedium!.apply(color: DColors.white)),
      dense: true,
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: DColors.white,
        ),
      ),
    );
  }
}
