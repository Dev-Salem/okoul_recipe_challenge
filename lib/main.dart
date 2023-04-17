import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/network/api_constance.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

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
/*
class Fake extends StatelessWidget {
  const Fake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: httpCall(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Text('$snapshot')),
            );
          }),
    );
  }
}

httpCall() async {
  final dio = Dio();
  dio.options.headers['${ApiConstance.headerOption}host'] =
      ApiConstance.apiHeader;
  dio.options.headers['${ApiConstance.headerOption}key'] = ApiConstance.apiKey;
  final response = await dio.get('${ApiConstance.baseURL}get-more-info',
      queryParameters: {'id': 8138});
  final result = DetailedRecipe.fromJson(response.data);
  return result;
  print(result);
}
*/