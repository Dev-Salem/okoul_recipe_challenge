import 'package:get_it/get_it.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/data_source/local_data_source.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/repository/local_storage_repository.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/add_recipe_to_favorite_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/get_stored_recipes_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/remove_recipe_from_favorite_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/data/data_source/home_remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/home/data/repository/home_repository_impl.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_by_query_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_list_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/data_source/remote_data_source.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/repository/recipe_details_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/repository/base_recipe_details_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/usecase/get_recipe_details_usecase.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';

final sl = GetIt.instance;

//HiveLocalDataSource
class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => HomeFeatureBloc(
        recipeListUseCase: sl(), recipeListByQueryUseCase: sl()));
    sl.registerFactory(() => RecipeDetailsBloc(sl()));
    sl.registerFactory(() => FavoriteBloc(sl(), sl(), sl()));

    //use case
    sl.registerLazySingleton<GetRecipeListUseCase>(
        () => GetRecipeListUseCase(sl()));
    sl.registerLazySingleton<GetRecipeListByQueryUseCase>(
        () => GetRecipeListByQueryUseCase(sl()));
    sl.registerLazySingleton<GetRecipeDetailsUseCase>(
        () => GetRecipeDetailsUseCase(sl()));
    sl.registerLazySingleton<GetStoredRecipesUseCase>(
        () => GetStoredRecipesUseCase(sl()));
    sl.registerLazySingleton<AddRecipeToFavoriteUseCase>(
        () => AddRecipeToFavoriteUseCase(sl()));
    sl.registerLazySingleton<RemoveRecipeFromFavoriteUseCase>(
        () => RemoveRecipeFromFavoriteUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepositoryImpl(baseRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseRecipeDetailsRepository>(
        () => RecipeDetailsRepository(sl()));
    sl.registerLazySingleton<BaseLocalStorageRepository>(
        () => LocalStorageRepository(sl()));

    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => DioRemoteDataSource());
    sl.registerLazySingleton<RecipeDetailsBaseRemoteDataSource>(
        () => DioRecipeDetailsDataSource());
    sl.registerLazySingleton(() => IsarLocalDataSource());
  }
}
