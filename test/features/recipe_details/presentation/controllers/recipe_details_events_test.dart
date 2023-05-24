import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';

void main() {
  group('Test RecipeDetailsEvent -', () {
    test('supports equality', () {
      expect(
          const RecipeDetailsEvents(0), equals(const RecipeDetailsEvents(0)));
    });
    test('props should have recipeId', () {
      expect(const RecipeDetailsEvents(0).props, equals([0]));
    });
    test('GetRecipeDetailsEvent supports equality', () {
      expect(const GetRecipeDetailsEvent(0),
          equals(const GetRecipeDetailsEvent(0)));
    });
  });
}
