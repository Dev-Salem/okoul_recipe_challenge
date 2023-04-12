import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';

abstract class BaseHomeRepository {
  EitherRecipeList getRecipeListByQuery(String query); //search specific recipes
  EitherRecipeList getRecipeList(); //return a feed for the home page
}
