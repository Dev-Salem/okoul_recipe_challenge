import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_card_model.dart';

void main() {
  test('Testing From Json of Recipe Card Model', () {
    final fakeJson = {
      "id": 768,
      "name": "Apple Pie",
      "thumbnail_url": "Http:test/testFromJson.png",
      "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 1}
    };
    final recipeCardModel = RecipeCardModel.formJson(fakeJson);
    expect(recipeCardModel.id, 768);
    expect(recipeCardModel.name, "Apple Pie");
    expect(recipeCardModel.imageURL, isA<String>());
    expect(recipeCardModel.rating.countNegative, 4);
    expect(recipeCardModel.rating.countPositive, 8);
    expect(recipeCardModel.rating.score, 1);
  });
}
