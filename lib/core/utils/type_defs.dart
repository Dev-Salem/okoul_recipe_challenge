import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

typedef EitherRecipeList = Future<Either<Failure, List<RecipeCard>>>;
