import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
  ServiceLocator().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: customTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
