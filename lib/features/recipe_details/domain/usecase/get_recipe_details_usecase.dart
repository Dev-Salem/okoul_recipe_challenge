import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';

class GetRecipeDetailsUseCase {
  final BaseRecipeDetailsRepository _baseRecipeDetailsRepository;
  const GetRecipeDetailsUseCase(this._baseRecipeDetailsRepository);

  Future<Either<Failure, DetailedRecipe>> call(int id) async {
    return await _baseRecipeDetailsRepository.getRecipeDetails(id);
  }
}
