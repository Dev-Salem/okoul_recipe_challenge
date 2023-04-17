import 'package:dio/dio.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/core/network/api_constance.dart';
import 'package:okoul_recipe_challenge/core/network/error_message.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/recipe_list_model.dart';

abstract class BaseRemoteDataSource {
  Future<RecipeCardsListModel> getRecipeListByQuery(
      String query, int from, int to);
  Future<RecipeCardsListModel> getRecipeList(int from, int to);
}

class DioRemoteDataSource extends BaseRemoteDataSource {
  final dio = createDioObject();

  @override
  Future<RecipeCardsListModel> getRecipeListByQuery(
      String query, int from, int to) async {
    final response = await dio.get(
      '${ApiConstance.baseURL}list',
      queryParameters: {'from': '$from', 'size': '$to', 'q': query},
    );
    if (response.statusCode == 200) {
      return RecipeCardsListModel.fromJson(response.data['results']);
    } else {
      print(response);
      throw NetworkException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<RecipeCardsListModel> getRecipeList(int from, int to) async {
    final response =
        await dio.get('${ApiConstance.baseURL}list', queryParameters: {
      'from': '$from',
      'size': '$to',
    });
    if (response.statusCode == 200) {
      return RecipeCardsListModel.fromJson(response.data['results']);
    } else {
      print(response);
      throw NetworkException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
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
