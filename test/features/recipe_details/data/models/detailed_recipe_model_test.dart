import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

void main() {
  test("Test FromJson Method of DetailedRecipeModel Entity", () {
    final fakeJson = {
      "name": "Apple Pie",
      "id": 123,
      "thumbnail_url": "http://applePie.png",
      "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 0.3},
      "instructions": [
        {'display_text': 'Cut the veggies', 'position': 0},
        {'display_text': 'Cut the veggies', 'position': 1}
      ],
      "sections": [
        {
          "components": [
            {"raw_text": "Fresh Chickpeas", "position": 0},
            {"raw_text": "Fresh Chickpeas", "position": 1}
          ]
        }
      ]
    };
    final detailedRecipe = DetailedRecipeModel.fromJson(fakeJson);
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
