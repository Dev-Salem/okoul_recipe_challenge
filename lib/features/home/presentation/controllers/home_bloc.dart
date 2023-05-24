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
      : super(const HomeState()) {
    on<GetFeedRecipesEvent>(_getFeedRecipes);
    on<GetSearchedRecipesEvent>(_getSearchedRecipes);
  }

  _getFeedRecipes(GetFeedRecipesEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(feedRequestState: RequestState.loading));
    try {
      if (state.feedMaxLimit) {
      } else {
        final response =
            await recipeListUseCase(state.feedRecipesList.length, 20);
        response.fold(
            (l) => emitter(state.copyWith(
                feedErrorMessage: l.message,
                feedRequestState: RequestState.error)), (r) {
          r.isEmpty
              ? emitter(state.copyWith(
                  feedMaxLimit: true, feedRequestState: RequestState.loaded))
              : emitter(state.copyWith(
                  feedRequestState: RequestState.loaded,
                  feedRecipesList: List.of(state.feedRecipesList)..addAll(r)));
        });
      }
    } catch (e) {
      emitter(state.copyWith(
          feedRequestState: RequestState.error,
          feedErrorMessage: e.toString()));
    }
  }

  _getSearchedRecipes(
      GetSearchedRecipesEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(
      searchRequestState: RequestState.loading,
    ));
    try {
      if (state.searchMaxLimit) {
      } else {
        final response = await recipeListByQueryUseCase(
            event.query, state.searchRecipesList.length, 20);
        response.fold(
            (l) => emitter(state.copyWith(
                searchErrorMessage: l.message,
                searchRequestState: RequestState.error)), (r) {
          return r.isEmpty
              ? emitter(state.copyWith(
                  searchMaxLimit: true,
                  searchRequestState: RequestState.loaded))
              : emitter(state.copyWith(
                  searchRequestState: RequestState.loaded,
                  searchRecipesList: List.of(state.searchRecipesList)
                    ..addAll(r)));
        });
      }
    } catch (e) {
      emitter(state.copyWith(
          searchRequestState: RequestState.error,
          searchErrorMessage: e.toString()));
    }
  }
}
