import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

void main() {
  test('Test Recipe Card List Entity', () {
    const recipeCardList = RecipeCardsList(recipes: [
      RecipeCard(
          name: "First",
          id: 1,
          imageURL: "imageURL",
          rating: Rating(countNegative: 1, countPositive: 1, score: 0.5)),
      RecipeCard(
          name: "Second",
          id: 2,
          imageURL: "imageURL",
          rating: Rating(countNegative: 3, countPositive: 3, score: 0.5)),
    ]);

    expect(recipeCardList.recipes.length, 2);
    expect(recipeCardList.recipes, [
      const RecipeCard(
          name: "First",
          id: 1,
          imageURL: "imageURL",
          rating: Rating(countNegative: 1, countPositive: 1, score: 0.5)),
      const RecipeCard(
          name: "Second",
          id: 2,
          imageURL: "imageURL",
          rating: Rating(countNegative: 3, countPositive: 3, score: 0.5)),
    ]);
  });
}
