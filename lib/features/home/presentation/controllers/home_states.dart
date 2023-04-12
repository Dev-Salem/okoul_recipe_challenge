// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_cards_list.dart';

class HomeStates extends Equatable {
  final RequestState requestState;
  final List<RecipeCard> recipeCardsList;
  final String errorMessage;

  const HomeStates(
      {this.requestState = RequestState.loading,
      this.recipeCardsList = const [],
      this.errorMessage = ''});
  @override
  List<Object?> get props => [requestState, recipeCardsList, errorMessage];

  HomeStates copyWith(
      {RequestState? requestState,
      List<RecipeCard>? recipeCardsList,
      String? errorMessage}) {
    return HomeStates(
        requestState: requestState ?? this.requestState,
        recipeCardsList: recipeCardsList ?? this.recipeCardsList,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class RecipeListState extends HomeStates {
  const RecipeListState();
}

class RecipeListFromQueryState extends HomeStates {
  const RecipeListFromQueryState();
}
