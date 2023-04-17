// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class RecipeDetailsState extends Equatable {
  final DetailedRecipe detailedRecipe;
  final RequestState requestState;
  final String errorMessage;

  const RecipeDetailsState(
      {this.detailedRecipe = const DetailedRecipe(
          name: '',
          id: 0,
          imageURL: '',
          rating: Rating(countPositive: 0, countNegative: 0, score: 0),
          instructions: [],
          sections: []),
      this.requestState = RequestState.loading,
      this.errorMessage = ''});

  @override
  List<Object> get props => [detailedRecipe, requestState, errorMessage];

  RecipeDetailsState copyWith({
    DetailedRecipe? detailedRecipe,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return RecipeDetailsState(
      detailedRecipe: detailedRecipe ?? this.detailedRecipe,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
