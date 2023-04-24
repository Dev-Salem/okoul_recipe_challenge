import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/data_source/remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';

class RecipeDetailsRepository extends BaseRecipeDetailsRepository {
  final RecipeDetailsBaseRemoteDataSource _baseRemoteDataSource;
  const RecipeDetailsRepository(this._baseRemoteDataSource);

  @override
  Future<Either<Failure, DetailedRecipe>> getRecipeDetails(int id) async {
    final result = await _baseRemoteDataSource.getRecipeDetails(id);
    try {
      return Right(result);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }
}
