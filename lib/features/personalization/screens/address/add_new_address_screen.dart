import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const DAppBar(title: Text(DTexts.addNewAddress), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: DTexts.name)),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: DTexts.phoneNumber)),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: DTexts.street))),
                  const SizedBox(width: DSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: DTexts.postalCode))),
                ]),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: DTexts.city))),
                  const SizedBox(width: DSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: DTexts.state))),
                ]),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: DTexts.country)),
                const SizedBox(height: DSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(DTexts.save),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
