import 'package:dio/dio.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/core/network/api_constance.dart';
import 'package:okoul_recipe_challenge/core/network/error_message.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/detailed_recipe_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class RecipeDetailsBaseRemoteDataSource {
  Future<DetailedRecipe> getRecipeDetails(int id);
}

class DioRecipeDetailsDataSource extends RecipeDetailsBaseRemoteDataSource {
  final dio = createDioObject();

  @override
  Future<DetailedRecipe> getRecipeDetails(int id) async {
    final response = await dio.get('${ApiConstance.baseURL}get-more-info',
        queryParameters: {'id': id});
    if (response.statusCode == 200) {
      return DetailedRecipeModel.fromJson(response.data);
    } else {
      throw NetworkException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }
}

Dio createDioObject() {
  final dio = Dio();
  dio.options.headers['${ApiConstance.headerOption}host'] =
      ApiConstance.apiHeader;
  dio.options.headers['${ApiConstance.headerOption}key'] = ApiConstance.apiKey;
  return dio;
}
