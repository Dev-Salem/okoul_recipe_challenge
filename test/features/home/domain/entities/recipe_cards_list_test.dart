import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

void main() {
  test('Test Recipe Card List Entity', () {
    const recipeCardList = RecipeCardsList(recipes: [recipeCard, recipeCard]);
    expect(recipeCardList.recipes.length, 2);
    expect(recipeCardList.recipes, [recipeCard, recipeCard]);
  });
}
