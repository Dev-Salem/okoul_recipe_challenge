import 'package:get_it/get_it.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/home/data/repository/home_repository_impl.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_by_query_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_list_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/data_source/remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/repository/recipe_details_reposiotry_impl.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/usecase/get_recipe_details_usecase.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => HomeFeatureBloc(
        recipeListUseCase: sl(), recipeListByQueryUseCase: sl()));
    sl.registerFactory(() => RecipeDetailsBloc(sl()));

    //use case
    sl.registerLazySingleton<GetRecipeListUseCase>(
        () => GetRecipeListUseCase(sl()));
    sl.registerLazySingleton<GetRecipeListByQueryUseCase>(
        () => GetRecipeListByQueryUseCase(sl()));
    sl.registerLazySingleton<GetRecipeDetailsUseCase>(
        () => GetRecipeDetailsUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepositoryImpl(baseRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseRecipeDetailsRepository>(
        () => RecipeDetailsRepository(sl()));

    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => DioRemoteDataSource());
    sl.registerLazySingleton<RecipeDetailsBaseRemoteDataSource>(
        () => DioRecipeDetailsDataSource());
  }
}
