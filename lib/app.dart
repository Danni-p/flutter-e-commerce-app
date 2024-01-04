import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/on-boarding/on_boarding_screen.dart';
import 'package:flutter_e_commerce_app/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Ecommerce App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: DAppTheme.lightTheme,
      darkTheme: DAppTheme.darkTheme,
      home: const OnBoardingScreen()
    );
  }
}
