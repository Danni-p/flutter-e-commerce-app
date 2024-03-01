import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

/// A widget for displaying an animated loading indicator with optional text and action button.
class DAnimationLoader extends StatelessWidget {
  /// Default constructor for the DAnimationLoader
  ///
  /// Parameters:
  ///
  ///   - text: The text to be displayed below the animation
  ///   - animation: the path to the Lottie animation file
  ///   - showAction: whether to show an action button below the text
  ///   - actionText: the text to be displayed on the action button
  ///   - onActionPressed: Callback function to be executed when the action button is pressed
  const DAnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width: size.width * 0.8),
          const SizedBox(height: DSizes.defaultSpace),
          Text(text,
              style: themeData.textTheme.bodyMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: DSizes.defaultSpace),
          showAction
              ? SizedBox(
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: DColors.dark),
                      child: Text(
                        actionText!,
                        style: themeData.textTheme.bodyMedium!
                            .apply(color: DColors.light),
                      )))
              : const SizedBox()
        ],
      ),
    );
  }
}
