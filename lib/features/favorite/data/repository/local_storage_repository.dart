import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/data_source/local_data_source.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  final IsarLocalDataSource _localDataSource;
  LocalStorageRepository(this._localDataSource);

  @override
  Future<Either<Failure, Unit>> addRecipeToFavorite(
      DetailedRecipe recipe) async {
    try {
      final result = await _localDataSource.addRecipeToFavorite(recipe);
      return Right(result);
    } catch (e) {
      return Left(LocalStorageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DetailedRecipe>>> getStoredRecipes() async {
    try {
      final result = await _localDataSource.getStoredRecipes();
      return Right(result);
    } catch (e) {
      return Left(LocalStorageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeRecipeFromFavorite(int index) async {
    try {
      final result = await _localDataSource.removeRecipeFromFavorite(index);
      return Right(result);
    } catch (e) {
      return Left(LocalStorageFailure(message: e.toString()));
    }
  }
}
