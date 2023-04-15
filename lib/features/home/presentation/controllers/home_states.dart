// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';

class HomeState extends Equatable {
  final ShowResult page;

  //States of get recipe card by query use_case
  final List<RecipeCard> recipeCardsByQuery;
  final RequestState recipeCardsByQueryState;
  final String recipeCardsByQueryMessage;

  //States of get recipe card by query use_case
  final List<RecipeCard> recipeCardsList;
  final RequestState recipeCardsListState;
  final String recipeCardsListErrorMessage;

  const HomeState({
    this.page = ShowResult.feed,
    this.recipeCardsByQuery = const [],
    this.recipeCardsByQueryState = RequestState.loading,
    this.recipeCardsByQueryMessage = '',
    this.recipeCardsList = const [],
    this.recipeCardsListState = RequestState.loading,
    this.recipeCardsListErrorMessage = '',
  });

  @override
  List<Object> get props {
    return [
      page,
      recipeCardsByQuery,
      recipeCardsByQueryState,
      recipeCardsByQueryMessage,
      recipeCardsList,
      recipeCardsListState,
      recipeCardsListErrorMessage,
    ];
  }

  HomeState copyWith(
      {List<RecipeCard>? recipeCardsByQuery,
      RequestState? recipeCardsByQueryState,
      String? recipeCardsByQueryMessage,
      List<RecipeCard>? recipeCardsList,
      RequestState? recipeCardsListState,
      String? recipeCardsListErrorMessage,
      ShowResult? page}) {
    return HomeState(
        recipeCardsByQuery: recipeCardsByQuery ?? this.recipeCardsByQuery,
        recipeCardsByQueryState:
            recipeCardsByQueryState ?? this.recipeCardsByQueryState,
        recipeCardsByQueryMessage:
            recipeCardsByQueryMessage ?? this.recipeCardsByQueryMessage,
        recipeCardsList: recipeCardsList ?? this.recipeCardsList,
        recipeCardsListState: recipeCardsListState ?? this.recipeCardsListState,
        recipeCardsListErrorMessage:
            recipeCardsListErrorMessage ?? this.recipeCardsListErrorMessage,
        page: page ?? this.page);
  }
}
