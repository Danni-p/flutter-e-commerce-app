import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class DSingleAdress extends StatelessWidget {
  const DSingleAdress({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Column(
      children: [
        DRoundedContainer(
          padding: const EdgeInsets.all(DSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor:
              selected ? DColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selected
              ? Colors.transparent
              : isDark
                  ? DColors.darkerGrey
                  : DColors.grey,
          margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
          child: Stack(children: [
            Positioned(
              right: DSizes.sm,
              top: 0,
              child: Icon(
                selected ? Iconsax.tick_circle : null,
                color: selected
                    ? isDark
                        ? DColors.light
                        : DColors.dark
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.titleLarge),
                const SizedBox(height: DSizes.sm / 2),
                const Text(
                  '(+123) 456 7890',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DSizes.sm / 2),
                const Text(
                  '822356 Timmy Coves, South Liana, Maine, 87665, USA',
                  softWrap: true,
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
