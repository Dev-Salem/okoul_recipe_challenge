import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

void main() {
  test("Test FromJson Method of DetailedRecipeModel Entity", () {
    final detailedRecipe =
        DetailedRecipeModel.fromJson(detailedRecipeMapObject);
    expect(detailedRecipe, isA<DetailedRecipe>());
    expect(detailedRecipe.instructions, isA<List<Instruction>>());
    expect(detailedRecipe.sections, isA<List<Sections>>());
    expect(detailedRecipe.id, 123);
    expect(detailedRecipe.name, 'Apple Pie');
    expect(detailedRecipe.imageURL, "http://applePie.png");
    expect(detailedRecipe.rating, isA<Rating>());
    expect(detailedRecipe.sections[0].components, isA<List<Component>>());
    expect(detailedRecipe.sections[0].components, isNotEmpty);
  });
}
