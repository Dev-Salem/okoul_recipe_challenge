import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/isar/isar_models.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/add_recipe_to_favorite_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/get_stored_recipes_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/domain/usecase/remove_recipe_from_favorite_usecase.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_states.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteState> {
  FavoriteBloc(this._addRecipeToFavoriteUseCase, this._getStoredRecipesUseCase,
      this._removeRecipeFromFavoriteUseCase)
      : super(const FavoriteState()) {
    on<GetStoredRecipesEvent>(_getStoredRecipesEvent);
    on<AddRecipeToFavoriteEvent>(_addRecipeToFavoriteEvent);
    on<RemoveRecipeFromFavoriteEvent>(_removeRecipeFromFavorite);
    instance.watchLazy().listen((event) {
      add(const GetStoredRecipesEvent());
    });
  }

  final GetStoredRecipesUseCase _getStoredRecipesUseCase;
  final AddRecipeToFavoriteUseCase _addRecipeToFavoriteUseCase;
  final RemoveRecipeFromFavoriteUseCase _removeRecipeFromFavoriteUseCase;
  final instance = Isar.getInstance()!.isarDetailedRecipes;

  _getStoredRecipesEvent(
      GetStoredRecipesEvent event, Emitter<FavoriteState> emitter) async {
    emitter(state.copyWith(
      requestState: RequestState.loading,
    ));
    final result = await _getStoredRecipesUseCase();
    result.fold(
        (l) => emitter(state.copyWith(
            requestState: RequestState.error, errorMessage: l.message)),
        (r) => emitter(state.copyWith(
            //feedbackMessage: 'Favorite List has been updated',
            requestState: RequestState.loaded,
            recipes: r)));
  }

  _addRecipeToFavoriteEvent(
      AddRecipeToFavoriteEvent event, Emitter<FavoriteState> emitter) async {
    emitter(state.copyWith(requestState: RequestState.loading));
    final result = await _addRecipeToFavoriteUseCase(event.recipe);
    result.fold(
        (l) => emitter(state.copyWith(
            requestState: RequestState.error, errorMessage: l.message)), (r) {
      emitter(state.copyWith(
          requestState: RequestState.loaded,
          feedbackMessage: "Recipe has been Added To Favorite"));
    });
  }

  _removeRecipeFromFavorite(RemoveRecipeFromFavoriteEvent event,
      Emitter<FavoriteState> emitter) async {
    emitter(state.copyWith(requestState: RequestState.loading));
    final result = await _removeRecipeFromFavoriteUseCase(event.index);
    result.fold(
        (l) => emitter(state.copyWith(
            requestState: RequestState.error, errorMessage: l.message)),
        (r) => emitter(state.copyWith(
            requestState: RequestState.loaded,
            feedbackMessage: "Recipe is Removed From Favorite")));
  }
}
