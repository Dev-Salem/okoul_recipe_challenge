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
  test('Test Get Recipe Details Remote Data Source', () {
    final mockCall = MockRecipeDetailsRemoteDataSource();
    final response =
        Response(statusCode: 200, requestOptions: RequestOptions(), data: '''
{
    name:"Apple",
    id: 983,
    thumbnail_url: "http:imageURl/test.png",
    user_ratings:{count_positive:0, count_negative: 2, score: null},
    instructions: [
      {
        display_text: "Buy an apple pie from your bakery",
        position: 0
      },
      {
        display_text: "Enjoy the pie!",
        position: 1
      }
    ],
    sections: [
      components: [
        {
          raw_text: "prepared apple pie",
          position: 0
        },
        {
          raw_text: "Some dish for serving",
          position: 1
        }
      ]
    ]
}
''');
    when(
      () => mockCall.getRecipeDetails(0),
    ).thenAnswer((invocation) async {
      return DetailedRecipeModel.fromJson(jsonDecode(response.data!));
    });
    // final detailedRecipe = mockCall.getRecipeDetails(0);
    // expect(detailedRecipe, isA<DetailedRecipe>());
  });
}
