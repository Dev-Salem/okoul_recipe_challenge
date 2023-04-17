// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';

class HomeState extends Equatable {
  //States of get recipe cards by query
  final List<RecipeCard> searchRecipesList;
  final RequestState searchRequestState;
  final String searchErrorMessage;
  final bool searchMaxLimit;

  //States of get recipe cards list [feed]
  final List<RecipeCard> feedRecipesList;
  final RequestState feedRequestState;
  final String feedErrorMessage;
  final bool feedMaxLimit;

  const HomeState({
    this.searchRecipesList = const [],
    this.searchRequestState = RequestState.loading,
    this.searchErrorMessage = '',
    this.searchMaxLimit = false,
    this.feedRecipesList = const [],
    this.feedRequestState = RequestState.loading,
    this.feedErrorMessage = '',
    this.feedMaxLimit = false,
  });

  @override
  List<Object> get props {
    return [
      searchRecipesList,
      searchRequestState,
      searchErrorMessage,
      searchMaxLimit,
      feedRecipesList,
      feedRequestState,
      feedErrorMessage,
      feedMaxLimit,
    ];
  }

  HomeState copyWith({
    List<RecipeCard>? searchRecipesList,
    RequestState? searchRequestState,
    String? searchErrorMessage,
    bool? searchMaxLimit,
    List<RecipeCard>? feedRecipesList,
    RequestState? feedRequestState,
    String? feedErrorMessage,
    bool? feedMaxLimit,
  }) {
    return HomeState(
      searchRecipesList: searchRecipesList ?? this.searchRecipesList,
      searchRequestState: searchRequestState ?? this.searchRequestState,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage,
      searchMaxLimit: searchMaxLimit ?? this.searchMaxLimit,
      feedRecipesList: feedRecipesList ?? this.feedRecipesList,
      feedRequestState: feedRequestState ?? this.feedRequestState,
      feedErrorMessage: feedErrorMessage ?? this.feedErrorMessage,
      feedMaxLimit: feedMaxLimit ?? this.feedMaxLimit,
    );
  }
}

/*
class HomeState extends Equatable {
  final List<RecipeCard> recipesList;
  final RequestState requestState;
  final String errorMessage;
  final bool recipesMaxLimit;

  const HomeState(
      {this.requestState = RequestState.loading,
      this.recipesList = const [],
      this.recipesMaxLimit = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [recipesList, requestState, errorMessage, recipesMaxLimit];

  HomeState copyWith({
    List<RecipeCard>? recipesList,
    RequestState? requestState,
    String? errorMessage,
    bool? recipesMaxLimit,
  }) {
    return HomeState(
      recipesList: recipesList ?? this.recipesList,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
      recipesMaxLimit: recipesMaxLimit ?? this.recipesMaxLimit,
    );
  }
}

class FeedState extends HomeState {}

class SearchState extends HomeState{}

*/