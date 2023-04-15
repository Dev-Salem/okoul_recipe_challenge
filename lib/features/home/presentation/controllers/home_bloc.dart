import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_by_query_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/domain/usecases/get_recipe_list_usecase.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';

class HomeFeatureBloc extends Bloc<HomeEvents, HomeState> {
  final GetRecipeListUseCase recipeListUseCase;
  final GetRecipeListByQueryUseCase recipeListByQueryUseCase;

  HomeFeatureBloc(
      {required this.recipeListUseCase, required this.recipeListByQueryUseCase})
      : super(const HomeState(recipeCardsByQueryState: RequestState.loading)) {
    on<GetRecipeListEvent>(_getRecipeList);
    on<GetRecipeListByQueryEvent>(_getRecipeListByQuery);
  }

  _getRecipeList(GetRecipeListEvent event, Emitter<HomeState> emitter) async {
    final response = await recipeListUseCase(state.recipeCardsList.length, 20);
    response.fold(
        (l) => emitter(state.copyWith(
            recipeCardsListState: RequestState.error,
            recipeCardsListErrorMessage: l.message)), (r) {
      if (r.isEmpty) {
        //if the user loaded all the recipe emit No more items
        emitter(state.copyWith(
          recipeCardsListState: RequestState.noItems,
        ));
      } else {
        emitter(state.copyWith(
            recipeCardsListState: RequestState.loaded,
            recipeCardsList: state.recipeCardsList + r));
      }
    });
  }

  _getRecipeListByQuery(
      GetRecipeListByQueryEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(
        recipeCardsByQueryState: RequestState.loading, page: ShowResult.query));
    final response = await recipeListByQueryUseCase(
        event.query, state.recipeCardsByQuery.length, 20);
    response.fold(
        (l) => emitter(state.copyWith(
            recipeCardsByQueryMessage: l.message,
            recipeCardsByQueryState: RequestState.error)), (r) {
      if (r.isEmpty) {
        emitter(state.copyWith(recipeCardsByQueryState: RequestState.noItems));
      } else {
        emitter(state.copyWith(
            recipeCardsByQueryState: RequestState.loaded,
            recipeCardsByQuery: r));
      }
    });
  }
}
