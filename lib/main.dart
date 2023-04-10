import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:okoul_recipe_challenge/features/search/domain/entities/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(onPressed: () async {}, child: Text("Hi")),
    ));
  }
}
/*
httpCall() async {
  final dio = Dio();
  dio.options.headers['x-rapidapi-host'] = 'tasty.p.rapidapi.com';
  dio.options.headers['x-rapidapi-key'] =
      '488ca2004bmshd3f99dddbc793a0p15318ajsn0fcab92d8687';
  final response = await dio.get(
    'https://tasty.p.rapidapi.com/recipes/list',
    queryParameters: {
      'from': '0',
      'size': '20',
    },
  );

  print(response.data);
}
*/
/*
Future<String> loadRecipeJson() async {
  return await rootBundle.loadString('assets/recipe_detalis.json');
}

Future loadRecipe() async {
  String jsonString = await loadRecipeJson();
  final jsonRespone = json.decode(jsonString);
  Recipe myRecipe = Recipe.formJson(jsonRespone);
  print(myRecipe.instructions);
}
*/