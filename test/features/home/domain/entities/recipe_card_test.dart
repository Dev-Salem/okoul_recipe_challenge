import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';

void main() {
  test('Test recipe card entity -', () {
    expect(recipeCard.name, "name");
    expect(recipeCard.id, 1);
    expect(recipeCard.imageURL, "imageURL");
    expect(recipeCard.rating.countNegative, 0);
    expect(recipeCard.rating.countPositive, 0);
    expect(recipeCard.rating.score, 1);
  });
}
