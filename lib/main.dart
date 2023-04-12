import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:okoul_recipe_challenge/core/network/api_constance.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_model.dart';
import 'dart:convert';

import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Hello world'));
  }
}

// httpCall() async {
//   final dio = Dio();
//   dio.options.headers['${ApiConstance.headerOption}host'] =
//       ApiConstance.apiHeader;
//   dio.options.headers['${ApiConstance.headerOption}key'] = ApiConstance.apiKey;
//   final response = await dio.get(
//     ApiConstance.baseURL,
//     queryParameters: {'from': '0', 'size': '20', 'q': ''},
//   );
//   final finalResult = RecipeCardsListModel.fromJson(response.data['results']);
//   print('Result:----------: ${finalResult.recipes}');
// }

// Future<String> loadRecipeJson() async {
//   return await rootBundle.loadString('assets/recipe_list_from_query.json');
// }

// Future loadRecipe() async {
//   String jsonString = await loadRecipeJson();
//   final jsonRespone = json.decode(jsonString);
//   RecipeCardsListModel myRecipes =
//       RecipeCardsListModel.fromJson(jsonRespone['results']);
//   return myRecipes.recipes;
// }

// Future<List<RecipeCard>> tryDio() async {
//   final dio = DioRemoteDataSource();
//   final response = await dio.getRecipeListByQuery('apple pie');

//   return response.recipes;
// }
