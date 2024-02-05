import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DBillingPricingSection extends StatelessWidget {
  const DBillingPricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(children: [
      /// -- SubTotal
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(DTexts.subtotal, style: themeData.textTheme.bodyMedium),
        Text('\$256.0', style: themeData.textTheme.bodyMedium)
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2),

      /// -- Shipping Fee
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(DTexts.shippingFee, style: themeData.textTheme.bodyMedium),
        Text('\$6.0', style: themeData.textTheme.labelLarge)
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2),

      /// -- Tax Fee
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(DTexts.taxFee, style: themeData.textTheme.bodyMedium),
        Text('\$6.0', style: themeData.textTheme.labelLarge)
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2),

      /// -- Order Total
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(DTexts.orderTotal, style: themeData.textTheme.bodyMedium),
        Text('\$6.0', style: themeData.textTheme.titleMedium)
      ]),
      const SizedBox(height: DSizes.spaceBtwItems / 2),
    ]);
  }
}