import 'package:dio/dio.dart';
import 'package:okoul_recipe_challenge/core/network/api_constance.dart';

class ApiClient {
  final _dio = Dio();

  Future<Response> get(
      String path, Map<String, dynamic> queryParameters) async {
    _dio.options.headers['${ApiConstance.headerOption}host'] =
        ApiConstance.apiHeader;
    _dio.options.headers['${ApiConstance.headerOption}key'] =
        ApiConstance.apiKey;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    try {
      final response = await _dio.get('${ApiConstance.baseURL}$path',
          queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data.toString());
      } else {
        throw Exception("Error connecting ot server");
      }
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }
}
