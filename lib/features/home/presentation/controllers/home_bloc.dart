import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_by_query_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_list_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';

class HomeFeatureBloc extends Bloc<HomeEvents, HomeStates> {
  final GetRecipeListUseCase recipeListUseCase;
  final GetRecipeListByQueryUseCase recipeListByQueryUseCase;

  HomeFeatureBloc(
      {required this.recipeListUseCase, required this.recipeListByQueryUseCase})
      : super(const HomeStates()) {
    on<GetRecipeListEvent>(_getRecipeList);
    on<GetRecipeListByQueryEvent>(_getRecipeListByQuery);
  }
  _getRecipeList(GetRecipeListEvent event, Emitter<HomeStates> emitter) async {
    final response = await recipeListUseCase();
    response.fold(
        (l) => emitter(state.copyWith(
              errorMessage: l.message,
              requestState: RequestState.error,
            )),
        (r) => emitter(state.copyWith(
            requestState: RequestState.loaded, recipeCardsList: r)));
  }

  _getRecipeListByQuery(
      GetRecipeListByQueryEvent event, Emitter<HomeStates> emitter) async {
    final response = await recipeListByQueryUseCase(
      event.query,
    );
    response.fold(
        (l) => emitter(state.copyWith(
            errorMessage: l.message, requestState: RequestState.error)),
        (r) => emitter(state.copyWith(
            requestState: RequestState.loaded, recipeCardsList: r)));
  }
}
