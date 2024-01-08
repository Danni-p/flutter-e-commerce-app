import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DSectionHeading extends StatelessWidget {
  const DSectionHeading(
      {super.key,
      this.textColor,
      this.showActionButton = false,
      required this.title,
      this.buttonTitle = DTexts.viewAll,
      this.onPressed});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return 
        Row(
          children: [
            Text(title,
                style: themeData.textTheme.headlineSmall!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            if (showActionButton) ... [
              TextButton(onPressed: onPressed, child: Text(buttonTitle))
            ]
          ],
        );
  }
}