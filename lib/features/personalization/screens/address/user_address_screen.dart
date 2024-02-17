import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_e_commerce_app/router/routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: DColors.primary,
          onPressed: () => Get.toNamed(Routes.addNewAddress),
          child: const Icon(Iconsax.add, color: DColors.white)),
      appBar: DAppBar(
        title: Text(DTexts.addresses, style: themeData.textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              DSingleAdress(selected: true),
              DSingleAdress(selected: false)
            ],
          ),
        ),
      ),
    );
  }
}
