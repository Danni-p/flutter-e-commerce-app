import 'package:flutter/material.dart';

class DProductTitleText extends StatelessWidget {
  const DProductTitleText({
    super.key,
    required this.title,
    this.dense = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool dense;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Text(
      title,
      style: dense ? themeData.textTheme.labelLarge : themeData.textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}