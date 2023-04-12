import 'package:okoul_recipe_challenge/core/type_defs/type_defs.dart';

abstract class BaseSearchRepository {
  EitherRecipeList getRecipeListByQuery(String query); //search specific recipes
  EitherRecipeList getRecipeList(); //return a feed for the home page
}
