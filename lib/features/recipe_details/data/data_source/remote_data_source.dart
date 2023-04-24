import 'package:okoul_recipe_challenge/core/network/api_client.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class RecipeDetailsBaseRemoteDataSource {
  Future<DetailedRecipe> getRecipeDetails(int id);
}

class DioRecipeDetailsDataSource extends RecipeDetailsBaseRemoteDataSource {
  @override
  Future<DetailedRecipe> getRecipeDetails(int id) async {
    final dio = ApiClient();
    final response = await dio.get("get-more-info", {'id': id});
    return DetailedRecipeModel.fromJson(response.data);
  }
}
