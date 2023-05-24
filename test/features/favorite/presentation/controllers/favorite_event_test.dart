import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_controllers.dart';

void main() {
  group('Test FavoriteEvents -', () {
    test('FavoriteEvents supports equality', () {
      expect(const FavoriteEvents(), equals(const FavoriteEvents()));
    });
    test('FavoriteEvents props should have []', () {
      expect(const FavoriteEvents().props, []);
    });
    test('AddRecipeToFavorite Event supports equality', () {
      expect(const AddRecipeToFavoriteEvent(recipe: detailedRecipe),
          equals(const AddRecipeToFavoriteEvent(recipe: detailedRecipe)));
    });
    test('AddRecipeToFavorite Event props should have detailedRecipe', () {
      expect(const AddRecipeToFavoriteEvent(recipe: detailedRecipe).props,
          [detailedRecipe]);
    });
    test('RemoveRecipeFromFavoriteEvent supports equality', () {
      expect(const RemoveRecipeFromFavoriteEvent(index: 0),
          equals(const RemoveRecipeFromFavoriteEvent(index: 0)));
    });
    test('RemoveRecipeFromFavoriteEvent props should have a number', () {
      expect(const RemoveRecipeFromFavoriteEvent(index: 0).props, [0]);
    });
    test('GetStoredRecipesEvent supports equality', () {
      expect(
          const GetStoredRecipesEvent(), equals(const GetStoredRecipesEvent()));
    });
    test('GetStoredRecipesEvent props should have []', () {
      expect(const GetStoredRecipesEvent().props, []);
    });
  });
}
