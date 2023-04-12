import 'package:equatable/equatable.dart';

class HomeEvents extends Equatable {
  const HomeEvents();

  @override
  List<Object?> get props => [];
}

class GetRecipeListEvent extends HomeEvents {
  const GetRecipeListEvent();
}

class GetRecipeListByQueryEvent extends HomeEvents {
  final String query;
  const GetRecipeListByQueryEvent(this.query);
  
}
