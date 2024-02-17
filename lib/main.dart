import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_e_commerce_app/injection.dart' as di;
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Supabase
  await Supabase.initialize(
    url: 'https://plojzevlylfjrkwlfnel.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBsb2p6ZXZseWxmanJrd2xmbmVsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMyMjUyOTQsImV4cCI6MjAxODgwMTI5NH0.A28R1djiBrJAh_6WJIufc-Y-2zMVLwe3srywnhmVqEY',
  );

  /// -- Dependency Injection
  await di.init();
  
  runApp(const App());
}