import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_states.dart';

void main() {
  group('FavoriteState -', () {
    test(
        'The initial value of FavoriteState should be [], errorMessage = '
        ', RequestState.loading ', () {
      expect(
          const FavoriteState(),
          equals(const FavoriteState(
              errorMessage: '',
              requestState: RequestState.loading,
              recipes: [])));
    });
    test('FavoriteState props should have "", [], RequestState.loading', () {
      expect(const FavoriteState().props,
          equals(<Object>[RequestState.loading, [], '']));
    });
    test('copyWith - returns the same object if not arguments are provided',
        () {
      expect(const FavoriteState(errorMessage: "Test"),
          const FavoriteState().copyWith(errorMessage: "Test"));
      expect(
          const FavoriteState(
              errorMessage: "Error",
              requestState: RequestState.loaded,
              recipes: detailedRecipes),
          equals(const FavoriteState().copyWith(
              errorMessage: "Error",
              requestState: RequestState.loaded,
              recipes: detailedRecipes)));
    });
  });
}
