import 'package:equatable/equatable.dart';

class HomeEvents extends Equatable {
  const HomeEvents();

  @override
  List<Object?> get props => [];
}

class GetFeedRecipesEvent extends HomeEvents {
  const GetFeedRecipesEvent();
}

class GetSearchedRecipesEvent extends HomeEvents {
  final String query;
  const GetSearchedRecipesEvent({
    required this.query,
  });
}

class GoToRecipeDetailsScreenEvent extends HomeEvents {
  final int recipeId;
  final bool fromFeed;
  const GoToRecipeDetailsScreenEvent(this.recipeId, this.fromFeed);
}

class GoBackToHomeScreen extends HomeEvents {
  final bool fromFeed;
  const GoBackToHomeScreen(this.fromFeed);
}
