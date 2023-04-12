// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';

class RecipeCardsList extends Equatable {
  //is meant to convert the list of recipe from the api into List<Recipe>
  final List<RecipeCard> recipes;

  const RecipeCardsList({
    required this.recipes,
  });

  @override
  List<Object> get props => [recipes];
}
