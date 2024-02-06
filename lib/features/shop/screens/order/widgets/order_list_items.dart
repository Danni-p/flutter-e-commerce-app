import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/order/widgets/order_item.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DOrderListItems extends StatelessWidget {
  const DOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      separatorBuilder: (_,__) => const SizedBox(height: DSizes.spaceBtwItems),
      
      itemBuilder: (_, index) => const DOrderItem());
  }
}
