import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

void main() {
  test('Test recipe card entity -', () {
    const recipeCard = RecipeCard(
        name: "Name Test",
        id: 10,
        imageURL: "http:imageURL",
        rating: Rating(countPositive: 1, countNegative: 2, score: 0.3));

    expect(recipeCard.name, "Name Test");
    expect(recipeCard.id, 10);
    expect(recipeCard.imageURL, "http:imageURL");
    expect(recipeCard.rating.countNegative, 2);
    expect(recipeCard.rating.countPositive, 1);
    expect(recipeCard.rating.score, 0.3);
  });
}
