import 'package:okoul_recipe_challenge/core/network/api_client.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';

abstract class BaseRemoteDataSource {
  Future<RecipeCardsListModel> getRecipeListByQuery(
      String query, int from, int to);
  Future<RecipeCardsListModel> getRecipeList(int from, int to);
}

class DioRemoteDataSource extends BaseRemoteDataSource {
  final dio = ApiClient();

  @override
  Future<RecipeCardsListModel> getRecipeList(int from, int to) async {
    final response = await dio.get("list", {
      'from': '$from',
      'size': '$to',
    });
    return RecipeCardsListModel.fromJson(response.data['results']);
  }

  @override
  Future<RecipeCardsListModel> getRecipeListByQuery(
      String query, int from, int to) async {
    final response =
        await dio.get("list", {'from': '$from', 'size': '$to', 'q': query});
    return RecipeCardsListModel.fromJson(response.data['results']);
  }
}
