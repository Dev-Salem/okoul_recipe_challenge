import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

class MockDataSource extends Mock implements BaseRemoteDataSource {}

void main() {
  group("Test Remote Data Source of Home Feature -", () {
    final MockDataSource mockCall = MockDataSource();
    final response = Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        statusMessage: "Success",
        data: jsonListOfRecipeCards);

    test(
        'When get recipe List is called, an instance of `RecipeCardsList` is expected',
        () async {
      when(
        () => mockCall.getRecipeList(0, 3),
      ).thenAnswer((invocation) async {
        return RecipeCardsListModel.fromJson(jsonDecode(response.data!));
      });
      final recipeCardsList = await mockCall.getRecipeList(0, 3);
      expect(recipeCardsList, isA<RecipeCardsList>());
    });

    test(
        "When getRecipeListByQuery is called, an instance of `RecipeCardList` is expected",
        () async {
      when(() => mockCall.getRecipeListByQuery("", 0, 3))
          .thenAnswer((invocation) async {
        return RecipeCardsListModel.fromJson(jsonDecode(response.data!));
      });
      final recipeCardsList = await mockCall.getRecipeListByQuery("", 0, 3);
      expect(recipeCardsList, isA<RecipeCardsList>());
    });
  });
}
