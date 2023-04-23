// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class FavoriteState extends Equatable {
  final RequestState requestState;
  final String errorMessage;
  final List<DetailedRecipe> recipes;

  const FavoriteState(
      {this.errorMessage = '',
      this.requestState = RequestState.loading,
      this.recipes = const []});

  @override
  List<Object> get props => [
        requestState,
        recipes,
        errorMessage,
      ];

  FavoriteState copyWith(
      {RequestState? requestState,
      String? feedbackMessage,
      List<DetailedRecipe>? recipes,
      String? errorMessage}) {
    return FavoriteState(
      errorMessage: errorMessage ?? this.errorMessage,
      requestState: requestState ?? this.requestState,
      recipes: recipes ?? this.recipes,
    );
  }
}
