import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/data_source/remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class MockRecipeDetailsRemoteDataSource extends Mock
    implements RecipeDetailsBaseRemoteDataSource {}

void main() {
  test('Test Get Recipe Details Remote Data Source', () async {
    final mockCall = MockRecipeDetailsRemoteDataSource();
    const String fakeJson = '''
    {
      "name": "Apple Pie",
      "id": 123,
      "thumbnail_url": "http://applePie.png",
      "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 0.3},
      "instructions": [
        {"display_text": "Cut the veggies", "position": 0},
        {"display_text": "Cut the veggies", "position": 1}
      ],
      "sections": [
        {
          "components": [
            {"raw_text": "Fresh Chickpeas", "position": 0},
            {"raw_text": "Fresh Chickpeas", "position": 1}
          ]
        }
      ]
    }
    ''';
    final response = Response(
        statusCode: 200, requestOptions: RequestOptions(), data: fakeJson);
    when(
      () => mockCall.getRecipeDetails(0),
    ).thenAnswer((invocation) async {
      return DetailedRecipeModel.fromJson(jsonDecode(response.data!));
    });
    final detailedRecipe = await mockCall.getRecipeDetails(0);
    expect(detailedRecipe, isA<DetailedRecipe>());
  });
}
