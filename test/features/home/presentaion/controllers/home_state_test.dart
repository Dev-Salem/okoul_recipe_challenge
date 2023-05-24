import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';

void main() {
  group("Test HomeState -", () {
    test('HomeState supports equality', () {
      expect(const HomeState(), equals(const HomeState()));
    });
    test('''The initial value of HomeState should be requestState.loading,
         errorMessage and recipes: [] and maxLimit is false''', () {
      expect(
          const HomeState(),
          equals(const HomeState(
              feedRecipesList: [],
              searchRecipesList: [],
              feedErrorMessage: '',
              searchErrorMessage: '',
              feedMaxLimit: false,
              searchMaxLimit: false,
              feedRequestState: RequestState.loading,
              searchRequestState: RequestState.loaded)));
    });
    test('copyWith - returns the same object if not arguments are provided',
        () {
      const result = HomeState(
        feedRecipesList: recipes,
        searchRecipesList: recipes,
        feedRequestState: RequestState.loaded,
        searchRequestState: RequestState.loaded,
      );
      expect(
          result,
          const HomeState().copyWith(
              feedRecipesList: recipes,
              searchRecipesList: recipes,
              feedRequestState: RequestState.loaded,
              searchRequestState: RequestState.loaded));
    });
  });
}
