import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/data_source/local_data_source.dart';

class MockLocalDataSource extends Mock implements BaseLocalDataSource {}

void main() {
  late MockLocalDataSource mockDataSource;
  setUp(() {
    mockDataSource = MockLocalDataSource();
  });
  group('Test Local Data Source -', () {
    test('When GetStoredRecipe is called, a list of DetailedRecipe is expected',
        () async {
      when(
        () => mockDataSource.getStoredRecipes(),
      ).thenAnswer((invocation) async {
        return detailedRecipes;
      });
      final storedRecipes = await mockDataSource.getStoredRecipes();
      expect(storedRecipes, detailedRecipes);
    });

    test('When addRecipeToFavorite is called, unit is expected', () async {
      when(
        () => mockDataSource.addRecipeToFavorite(detailedRecipe),
      ).thenAnswer((invocation) async {
        return unit;
      });
      final addRecipeToFav =
          await mockDataSource.addRecipeToFavorite(detailedRecipe);
      expect(addRecipeToFav, unit);
    });
    test('When removeRecipeFromFavorite is called, unit is expected', () async {
      when(
        () => mockDataSource.removeRecipeFromFavorite(0),
      ).thenAnswer((invocation) async {
        return unit;
      });
      final removeRecipe = await mockDataSource.removeRecipeFromFavorite(0);
      expect(removeRecipe, unit);
    });
  });
}
