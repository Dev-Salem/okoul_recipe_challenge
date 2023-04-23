import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class FavoriteEvents extends Equatable {
  const FavoriteEvents();

  @override
  List<Object?> get props => [];
}

class AddRecipeToFavoriteEvent extends FavoriteEvents {
  final DetailedRecipe recipe;

  @override
  List<Object?> get props => [recipe];
  const AddRecipeToFavoriteEvent({required this.recipe});
}

class RemoveRecipeFromFavoriteEvent extends FavoriteEvents {
  final int index;

  @override
  List<Object?> get props => [index];
  const RemoveRecipeFromFavoriteEvent({required this.index});
}

class GetStoredRecipesEvent extends FavoriteEvents {
  const GetStoredRecipesEvent();

  @override
  List<Object?> get props => [];
}
