import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/recipe_card_widget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import '../../data/models/recipe_list_model.dart';

class TabBarViewWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarViewWidget({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: tabController, children: [
      FutureBuilder(
        future: loadRecipe(),
        initialData: const [],
        builder: (context, snapshot) {
          final data = snapshot.data;
          return GridView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => RecipeCardWidget(
                name: data[index].name,
                imageURL: data[index].imageURL,
                rating: data[index].rating.score),
            addRepaintBoundaries: false,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          );
        },
      ),
      const Text('HI 2')
    ]);
  }
}

Future<String> loadRecipeJson() async {
  return await rootBundle.loadString('assets/recipe_list_from_query.json');
}

Future loadRecipe() async {
  String jsonString = await loadRecipeJson();
  final jsonRespone = json.decode(jsonString);
  RecipeCardsListModel myRecipes =
      RecipeCardsListModel.fromJson(jsonRespone['results']);
  print(myRecipes.recipes[0].imageURL);
  return myRecipes.recipes;
}
