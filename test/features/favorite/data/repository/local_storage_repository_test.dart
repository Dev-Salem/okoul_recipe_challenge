import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';

class MockLocalStorageRepository extends Mock
    implements BaseLocalStorageRepository {}

void main() {
  late MockLocalStorageRepository mockRepo;
  setUp(() {
    mockRepo = MockLocalStorageRepository();
  });

  group('Test Local Data Source Repository -', () {
    test(
        'When getStoreRecipes is called, detailedRecipe list wrapped in Right is expected',
        () async {
      when(
        () => mockRepo.getStoredRecipes(),
      ).thenAnswer((invocation) async {
        return const Right(detailedRecipes);
      });
      final getStoredRecipes = await mockRepo.getStoredRecipes();
      expect(getStoredRecipes, isA<Right>());
      getStoredRecipes.fold((l) => null, (r) {
        expect(r, detailedRecipes);
      });
    });
    test(
        'When getStoredRecipes is called, Failure with message wrapped in Left is expected',
        () async {
      when(
        () => mockRepo.getStoredRecipes(),
      ).thenAnswer((invocation) async {
        return const Left(Failure(message: "Error"));
      });
      final failure = await mockRepo.getStoredRecipes();
      expect(failure, isA<Left>());
      failure.fold((l) {
        expect(l, isA<Failure>());
        expect(l.message, "Error");
      }, (r) => null);
    });

    //add to favorite
    test(
        'When addRecipeToFavorite is called, unit wrapped in Right is expected',
        () async {
      when(
        () => mockRepo.addRecipeToFavorite(detailedRecipe),
      ).thenAnswer((invocation) async {
        return const Right(unit);
      });
      final addRecipeToFav = await mockRepo.addRecipeToFavorite(detailedRecipe);
      expect(addRecipeToFav, isA<Right>());
      addRecipeToFav.fold((l) => null, (r) {
        expect(r, unit);
      });
    });
    test(
        'When addRecipeToFavorite is called, Failure with message wrapped in Left is expected',
        () async {
      when(
        () => mockRepo.addRecipeToFavorite(detailedRecipe),
      ).thenAnswer((invocation) async {
        return const Left(Failure(message: "Error"));
      });
      final failure = await mockRepo.addRecipeToFavorite(detailedRecipe);
      expect(failure, isA<Left>());
      failure.fold((l) {
        expect(l, isA<Failure>());
        expect(l.message, "Error");
      }, (r) => null);
    });
    //remove from favorite
    test(
        'When removeRecipeFromFavorite is called, unit wrapped in Right is expected',
        () async {
      when(
        () => mockRepo.removeRecipeFromFavorite(0),
      ).thenAnswer((invocation) async {
        return const Right(unit);
      });
      final remove = await mockRepo.removeRecipeFromFavorite(0);
      expect(remove, isA<Right>());
      remove.fold((l) => null, (r) {
        expect(r, unit);
      });
    });
    test(
        'When removeRecipeFromFavorite is called, Failure with message wrapped in Left is expected',
        () async {
      when(
        () => mockRepo.removeRecipeFromFavorite(0),
      ).thenAnswer((invocation) async {
        return const Left(Failure(message: "Error"));
      });
      final failure = await mockRepo.removeRecipeFromFavorite(0);
      expect(failure, isA<Left>());
      failure.fold((l) {
        expect(l, isA<Failure>());
        expect(l.message, "Error");
      }, (r) => null);
    });
  });
}
