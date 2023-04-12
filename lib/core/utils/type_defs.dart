import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';

typedef EitherRecipeList = Future<Either<Failure, RecipeCardsListModel>>;
