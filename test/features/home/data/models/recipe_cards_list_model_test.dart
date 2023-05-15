import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

void main() {
  test('Test Recipe Cards List Model', () {
    final fakeJson = [
      {
        "id": 768,
        "name": "Apple Pie",
        "thumbnail_url": "Http:test/testFromJson.png",
        "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 1}
      },
      {
        "id": 500,
        "name": "Egg scrambles",
        "thumbnail_url": "Http:test/testFromJson.png",
        "user_ratings": {
          "count_positive": 1,
          "count_negative": 0,
          "score": null
        }
      }
    ];
    final recipeCardsList = RecipeCardsListModel.fromJson(fakeJson);
    expect(recipeCardsList.recipes, isA<List<RecipeCard>>());
    expect(recipeCardsList.recipes.length, fakeJson.length);
  });
}
