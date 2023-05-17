import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

void main() {
  test("Test `DetailedRecipe` entity", () {
    const detailedRecipe = DetailedRecipe(
        name: "name",
        id: 1,
        imageURL: "imageURL",
        rating: Rating(countPositive: 0, countNegative: 0, score: 0.5),
        instructions: <Instruction>[],
        sections: <Sections>[]);
    expect(detailedRecipe.name, "name");
    expect(detailedRecipe.id, 1);
    expect(detailedRecipe.imageURL, "imageURL");
    expect(detailedRecipe.rating, isA<Rating>());
    expect(detailedRecipe.instructions, isA<List<Instruction>>());
    expect(detailedRecipe.sections, isA<List<Sections>>());
  });
}
