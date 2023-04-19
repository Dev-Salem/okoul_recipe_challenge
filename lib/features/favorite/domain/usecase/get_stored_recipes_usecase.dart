import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class GetStoredRecipesUseCase {
  final BaseLocalStorageRepository _baseLocalStorageRepository;
  const GetStoredRecipesUseCase(this._baseLocalStorageRepository);
  Either<Failure, List<DetailedRecipe>> call() {
    return _baseLocalStorageRepository.getStoredRecipes();
  }
}
