import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/cart/coupon_code.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/checkout/billing_address_section.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/checkout/billing_payment_section.dart';
import 'package:flutter_e_commerce_app/common/widgets/products/checkout/billing_pricing_section.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_e_commerce_app/navigation_menu.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: DAppBar(
        title: Text(DTexts.cart, style: themeData.textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in cart
              const DCartItems(showAddRemoveButtons: false),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// -- Coupon Textfield
              const DCouponCode(),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// -- Billing Section
              DRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(DSizes.md),
                backgroundColor: isDark ? DColors.black : DColors.white,
                child: const Column(
                  children: [
                    /// -- Pricing
                    DBillingPricingSection(),
                    SizedBox(height: DSizes.spaceBtwItems),

                    /// -- Divider
                    Divider(),
                    SizedBox(height: DSizes.spaceBtwItems),

                    /// -- Payment Methods
                    DBillingPaymentSection(),
                    SizedBox(height: DSizes.spaceBtwItems),

                    /// -- Address
                    DBillingAddressSection(),
                    SizedBox(height: DSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: DImages.successfulPaymentIcon,
                title: DTexts.paymentSuccess,
                subTitle: DTexts.paymentSuccessSubTitle,
                primaryBtnText: DTexts.continueText,
                onPrimaryPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
            child: const Text('${DTexts.checkout} \$256.0')),
      ),
    );
  }
}
