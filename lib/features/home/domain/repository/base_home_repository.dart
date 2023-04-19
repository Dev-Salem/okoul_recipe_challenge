import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';

abstract class BaseHomeRepository {
  EitherRecipeList getRecipeListByQuery(
      String query, int from, int to); //search specific recipes
  EitherRecipeList getRecipeList(
      int from, int to); //return a feed for the Feed tab
}
