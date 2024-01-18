import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/text_theme.dart';

class DAppTheme {
  DAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: DColors.white,
    textTheme: DTextTheme.lightTextTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.lightOutlinedButtonTheme,
    appBarTheme: DAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: DCheckboxTheme.lightCheckboxTheme,
    chipTheme: DChipTheme.lightChipTheme,
    inputDecorationTheme: DTextFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: DColors.black,
    textTheme: DTextTheme.darkTextTheme,
    elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.darkOutlinedButtonTheme,
    appBarTheme: DAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: DCheckboxTheme.darkCheckboxTheme,
    chipTheme: DChipTheme.darkChipTheme,
    inputDecorationTheme: DTextFieldTheme.darkInputDecorationTheme
  );

}