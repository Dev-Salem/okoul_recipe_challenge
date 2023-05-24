import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/rating.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_states.dart';

void main() {
  const DetailedRecipe recipe = DetailedRecipe(
      name: '',
      id: 0,
      imageURL: '',
      rating: Rating(countPositive: 0, countNegative: 0, score: 0),
      instructions: [],
      sections: []);
  group('Recipe Details State test -', () {
    test('''
    The initial value of RecipeDetailsState should be RequestState.loading,
    errorMessage = '', detailedRecipe = DetailedRecipe(...)
    ''', () {
      const state = RecipeDetailsState();
      expect(
          state,
          equals(const RecipeDetailsState(
              requestState: RequestState.loading,
              errorMessage: '',
              detailedRecipe: recipe)));
    });
    test('props should have errorMessage, detailedRecipe, requestState', () {
      expect(const RecipeDetailsState().props,
          equals([recipe, RequestState.loading, '']));
    });
    test('copyWith - returns the same object if not arguments are provided',
        () {
      const cannedState = RecipeDetailsState(
          errorMessage: "",
          requestState: RequestState.loaded,
          detailedRecipe: recipe);
      expect(
          cannedState,
          equals(const RecipeDetailsState().copyWith(
              requestState: RequestState.loaded, detailedRecipe: recipe)));
    });
  });
}
