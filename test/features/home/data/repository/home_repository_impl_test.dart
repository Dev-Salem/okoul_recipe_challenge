import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class MockHomeRepositoryImpl extends Mock implements BaseHomeRepository {}

void main() {
  final mockRepo = MockHomeRepositoryImpl();
  group("Test Home Repository -", () {
    test(
        "if getRecipeList is called a List of recipes warped in Right is expected",
        () async {
      when(
        () => mockRepo.getRecipeList(0, 3),
      ).thenAnswer((invocation) async {
        return const Right(<RecipeCard>[recipeCard, recipeCard]);
      });
      final recipes = await mockRepo.getRecipeList(0, 3);
      expect(recipes, isA<Right>());
      recipes.fold((l) => null, (r) {
        expect(r, isA<List<RecipeCard>>());
        expect(r, isNotEmpty);
      });
    });

    test(
        'If getRecipeList is called, an exception message warped in Left is expected',
        () async {
      when(
        () => mockRepo.getRecipeList(0, 3),
      ).thenAnswer((invocation) async {
        return const Left(Failure(message: "Error Occurred"));
      });
      final failure = await mockRepo.getRecipeList(0, 3);
      expect(failure, isA<Left>());
      failure.fold((l) {
        expect(l.message, isA<String>());
        expect(l.message, isNotEmpty);
      }, (r) => null);
    });

    test(
        "if getRecipeListByQuery is called a List of recipes warped in Right is expected",
        () async {
      when(
        () => mockRepo.getRecipeListByQuery("", 0, 3),
      ).thenAnswer((invocation) async {
        return const Right(<RecipeCard>[recipeCard, recipeCard]);
      });
      final recipes = await mockRepo.getRecipeListByQuery("", 0, 3);
      expect(recipes, isA<Right>());
      recipes.fold((l) => null, (r) {
        expect(r, isA<List<RecipeCard>>());
        expect(r, isNotEmpty);
      });
    });

    test(
        'If getRecipeListByQuery is called, an exception message warped in Left is expected',
        () async {
      when(
        () => mockRepo.getRecipeListByQuery("", 0, 3),
      ).thenAnswer((invocation) async {
        return const Left(Failure(message: "Error Occurred"));
      });
      final failure = await mockRepo.getRecipeListByQuery("", 0, 3);
      expect(failure, isA<Left>());
      failure.fold((l) {
        expect(l.message, isA<String>());
        expect(l.message, isNotEmpty);
      }, (r) => null);
    });
  });
}
