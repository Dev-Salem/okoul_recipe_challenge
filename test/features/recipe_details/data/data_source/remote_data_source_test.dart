import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/data_source/remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class MockRecipeDetailsRemoteDataSource extends Mock
    implements RecipeDetailsBaseRemoteDataSource {}

void main() {
  test('Test Get Recipe Details Remote Data Source', () async {
    final mockCall = MockRecipeDetailsRemoteDataSource();
    final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(),
        data: detailedRecipeJson);
    when(
      () => mockCall.getRecipeDetails(0),
    ).thenAnswer((invocation) async {
      return DetailedRecipeModel.fromJson(jsonDecode(response.data!));
    });
    final detailedRecipe = await mockCall.getRecipeDetails(0);
    expect(detailedRecipe, isA<DetailedRecipe>());
  });
}
