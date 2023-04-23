// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_card_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

class RecipeCardsListModel extends RecipeCardsList {
  const RecipeCardsListModel({required super.recipes});

  factory RecipeCardsListModel.fromJson(List<dynamic> json) {
    List<RecipeCardModel> recipes =
        json.map((e) => RecipeCardModel.formJson(e)).toList();
    return RecipeCardsListModel(recipes: recipes);
  }
}
