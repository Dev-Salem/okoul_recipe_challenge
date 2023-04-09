// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/search/domain/entities/ingredient.dart';

class Recipe extends Equatable {
  final String name;
  final int id;
  final String imageURL;
  final List<String> instructions;
  final double rating;
  final List<Ingredient> ingredients;

  const Recipe({
    required this.name,
    required this.id,
    required this.imageURL,
    required this.instructions,
    required this.rating,
    required this.ingredients,
  });

  @override
  List<Object> get props {
    return [
      name,
      id,
      imageURL,
      instructions,
      rating,
      ingredients,
    ];
  }
}
