import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class BaseRecipeDetailsRepository {
  Future<Either<Failure, DetailedRecipe>> getRecipeDetails(int id);
}
