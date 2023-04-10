import 'package:okoul_recipe_challenge/core/type_defs/type_defs.dart';

abstract class BaseSearchRepository {
  EitherRecipeList getRecipeFromName();
}
