import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/usecase/get_recipe_details_usecase.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_states.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvents, RecipeDetailsState> {
  final GetRecipeDetailsUseCase _getRecipeDetailsUseCase;

  RecipeDetailsBloc(this._getRecipeDetailsUseCase)
      : super(const RecipeDetailsState()) {
    on<GetRecipeDetailsEvent>(_getRecipeDetailsEvent);
  }

  _getRecipeDetailsEvent(
      GetRecipeDetailsEvent event, Emitter<RecipeDetailsState> emitter) async {
    emitter(state.copyWith(requestState: RequestState.loading));
    final response = await _getRecipeDetailsUseCase(event.recipeId);
    response.fold(
        (l) => emitter(state.copyWith(
            errorMessage: l.message, requestState: RequestState.error)),
        (r) => emitter(state.copyWith(
            requestState: RequestState.loaded, detailedRecipe: r)));
  }
}
