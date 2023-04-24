import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class HomeRepositoryImpl extends BaseHomeRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  HomeRepositoryImpl({required this.baseRemoteDataSource});

  @override
  EitherRecipeList getRecipeList(int from, int to) async {
    final result = await baseRemoteDataSource.getRecipeList(from, to);
    try {
      return Right(result.recipes);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }

  @override
  EitherRecipeList getRecipeListByQuery(String query, int from, int to) async {
    final result =
        await baseRemoteDataSource.getRecipeListByQuery(query, from, to);
    try {
      return Right(result.recipes);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }
}
