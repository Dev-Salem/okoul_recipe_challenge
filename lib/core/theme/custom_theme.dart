import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/theme/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

final customTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.additionalColor,
    cardColor: AppColors.secondaryBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
    textTheme: GoogleFonts.dosisTextTheme(
            const TextTheme(headlineSmall: TextStyle(color: Colors.white)))
        .copyWith(headlineLarge: GoogleFonts.abrilFatface(fontSize: 55)),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white30,
      indicator: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.additionalColor,
                blurRadius: 10,
                spreadRadius: 2)
          ],
          color: AppColors.additionalColor,
          borderRadius: BorderRadius.circular(25)),
    ),
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.white.withOpacity(0.4),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.lightColor,
            )),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))));
