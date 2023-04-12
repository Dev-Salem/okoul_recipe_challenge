import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/theme/app_color.dart';

final customTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)))));
