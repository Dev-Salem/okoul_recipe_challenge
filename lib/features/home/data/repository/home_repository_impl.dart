import 'package:dartz/dartz.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/core/errors/failure.dart';
import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class HomeRepositoryImpl implements BaseHomeRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  const HomeRepositoryImpl({required this.baseRemoteDataSource});

  @override
  EitherRecipeList getRecipeList() async {
    final result = await baseRemoteDataSource.getRecipeList();
    try {
      return Right(result.recipes);
    } on NetworkException catch (failure) {
      return Left(
          NetworkFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  EitherRecipeList getRecipeListByQuery(String query) async {
    final result = await baseRemoteDataSource.getRecipeListByQuery(query);
    try {
      return Right(result.recipes);
    } on NetworkException catch (failure) {
      return Left(
          NetworkFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
