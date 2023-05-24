import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

void main() {
  test('Test Recipe Cards List Model', () {
    final recipeCardsList =
        RecipeCardsListModel.fromJson(listOfRecipeCardMapObject);
    expect(recipeCardsList.recipes, isA<List<RecipeCard>>());
    expect(recipeCardsList.recipes.length, listOfRecipeCardMapObject.length);
  });
}
