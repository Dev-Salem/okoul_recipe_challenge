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
  @override
  List<Object?> get props => [query];
  const GetSearchedRecipesEvent({
    required this.query,
  });
}
