import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';

class MockRecipeDetailsRepository extends Mock
    implements BaseRecipeDetailsRepository {}

void main() {
  final mockRepository = MockRecipeDetailsRepository();
  group("Test Recipe Details Repository -", () {
    test(
        'When GetRecipeDetails is called, DetailedRecipe wrapped in Right is expected',
        () async {
      when(
        () => mockRepository.getRecipeDetails(0),
      ).thenAnswer((invocation) async {
        return const Right(detailedRecipe);
      });
      final detailedRecipeAnswer = await mockRepository.getRecipeDetails(0);
      expect(detailedRecipeAnswer, isA<Right>());
      detailedRecipeAnswer.fold((l) => null, (r) {
        expect(r, isA<DetailedRecipe>());
      });
    });

    test(
        'When getRecipeDetails is called, a failure with message thats wrapped in left is expected',
        () async {
      when(() => mockRepository.getRecipeDetails(0))
          .thenAnswer((invocation) async {
        return const Left(Failure(message: "Error"));
      });
      final error = await mockRepository.getRecipeDetails(0);
      expect(error, isA<Left>());
      error.fold((l) {
        expect(l, isA<Failure>());
        expect(l.message, isNotEmpty);
      }, (r) => null);
    });
  });
}
