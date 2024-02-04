import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class DRatingProgressIndicator extends StatelessWidget {
  const DRatingProgressIndicator({
    super.key, required this.text, required this.value,

  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(text,
                style: themeData.textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
              value: value,
              minHeight: 12,
              backgroundColor: DColors.grey,
              borderRadius: BorderRadius.circular(
                  DSizes.borderRadiusMd),
              valueColor: const AlwaysStoppedAnimation(
                  DColors.primary)),
        )
      ],
    );
  }
}