import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/controller/signup/signup_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DTermsAndConditionsCheckbox extends StatelessWidget {
  const DTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isDark = DHelperFunctions.isDarkMode(context);
    final signupController = SignupController.instance;

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(value: signupController.privacyPolicy.value, onChanged: ((value) => signupController.setPrivacyPolicy(value))),
          )),
      const SizedBox(width: DSizes.spaceBtwItems),
      Flexible(
        child: Text.rich(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          TextSpan(children: [
            TextSpan(
                text: '${DTexts.iAgreeTo} ',
                style: themeData.textTheme.bodySmall),
            TextSpan(
                text: DTexts.privacyPolicy,
                style: themeData.textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    color: isDark ? DColors.white : DColors.primary)),
            TextSpan(
                text: ' ${DTexts.and} ', style: themeData.textTheme.bodySmall),
            TextSpan(
                text: DTexts.termsOfUse,
                style: themeData.textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    color: isDark ? DColors.white : DColors.primary))
          ]),
        ),
      )
    ]);
  }
}
