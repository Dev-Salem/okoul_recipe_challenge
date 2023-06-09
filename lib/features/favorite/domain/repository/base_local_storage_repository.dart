import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class BaseLocalStorageRepository {
  Future<Either<Failure, List<DetailedRecipe>>> getStoredRecipes();
  Future<Either<Failure, Unit>> addRecipeToFavorite(DetailedRecipe recipe);
  Future<Either<Failure, Unit>> removeRecipeFromFavorite(int index);
}
