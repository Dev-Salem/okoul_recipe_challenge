import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';

class MockRecipeDetailsRepository extends Mock
    implements BaseRecipeDetailsRepository {}

void main() {
  final mockRepository = MockRecipeDetailsRepository();

  group("Test Recipe Details Repository -", () {
    test(
        'When GetRecipeDetails is called, DetailedRecipe warped in Right is expected',
        () async {
      when(
        () => mockRepository.getRecipeDetails(0),
      ).thenAnswer((invocation) async {
        const detailedRecipe = DetailedRecipe(
            name: "name",
            id: 0,
            imageURL: "imageURL",
            rating: Rating(countPositive: 0, countNegative: 0, score: 0.5),
            instructions: [
              Instruction(
                  instructionDescription: "instructionDescription", step: 0),
              Instruction(
                  instructionDescription: "instructionDescription", step: 1)
            ],
            sections: [
              Sections(components: [
                Component(
                    ingredientDescription: "ingredientDescription", step: 0),
                Component(
                    ingredientDescription: "ingredientDescription", step: 1),
              ])
            ]);
        return const Right(detailedRecipe);
      });
      final detailedRecipe = await mockRepository.getRecipeDetails(0);
      expect(detailedRecipe, isA<Right>());
      detailedRecipe.fold((l) => null, (r) {
        expect(r, isA<DetailedRecipe>());
      });
    });

    test(
        'When getRecipeDetails is called, a failure with message thats warped in left is expected',
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
