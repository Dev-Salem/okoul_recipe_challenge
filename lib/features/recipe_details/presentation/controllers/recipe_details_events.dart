import 'package:equatable/equatable.dart';

class RecipeDetailsEvents extends Equatable {
  final int recipeId;
  const RecipeDetailsEvents(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}

class GetRecipeDetailsEvent extends RecipeDetailsEvents {
  const GetRecipeDetailsEvent(super.recipeId);
}
