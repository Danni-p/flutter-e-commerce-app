import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: DAppTheme.lightTheme,
      darkTheme: DAppTheme.darkTheme
    );
  }
}
