import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_card_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

void main() {
  test('Testing From Json of Recipe Card Model', () {
    final recipeCardModel = RecipeCardModel.formJson(recipeCardMapObject);
    expect(recipeCardModel.id, 768);
    expect(recipeCardModel.name, "Apple Pie");
    expect(recipeCardModel.imageURL, isA<String>());
    expect(recipeCardModel.rating, isA<Rating>());
    expect(recipeCardModel.rating.countNegative, 4);
    expect(recipeCardModel.rating.countPositive, 8);
    expect(recipeCardModel.rating.score, 1);
  });
}
