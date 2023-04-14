import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
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
