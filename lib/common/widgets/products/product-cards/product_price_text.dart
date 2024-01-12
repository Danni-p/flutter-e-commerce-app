import 'package:flutter/material.dart';

class DProductPriceText extends StatelessWidget {
  const DProductPriceText({
    super.key,
    this.currency = '\$',
    required this.price,
    this.maxLines = 1,
    this.dense = false,
    this.lineThrough = false,
  });

  final String currency, price;
  final int maxLines;
  final bool dense;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Text(
      currency + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: dense
          ? themeData.textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : themeData.textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
