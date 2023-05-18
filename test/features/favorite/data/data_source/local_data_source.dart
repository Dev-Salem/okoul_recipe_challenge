import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/data_source/local_data_source.dart';

class MockLocalDataSource extends Mock implements BaseLocalDataSource {}

void main() {
  final mockDataSource = MockLocalDataSource();
  group('Test Local Data Source -', () {
    test('When GetStoredRecipe is called, a list of DetailedRecipe is expected',
        () async {
      when(
        () => mockDataSource.getStoredRecipes(),
      ).thenAnswer((invocation) async {
        return detailedRecipes;
      });
      final storedRecipes = await mockDataSource.getStoredRecipes();
      expect(storedRecipes, detailedRecipe);
    });
  });
}
