import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/search/domain/entities/ingredient.dart';
import 'package:okoul_recipe_challenge/features/search/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/search/domain/entities/rating.dart';

class Recipe extends Equatable {
  final String name;
  final int id;
  final String imageURL;
  final List<Instruction> instructions;
  final Rating rating;
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
/*
  factory Recipe.formJson(Map<String, dynamic> json) {
    var listOfIngredients = json['sections'][0]['components'] as List;
    List<Ingredient> ingredients =
        listOfIngredients.map((e) => Ingredient.fromMap(e)).toList();
    var listOfInstructions = json['instructions'] as List;
    List<Instruction> instructions =
        listOfInstructions.map((e) => Instruction.fromMap(e)).toList();
    return Recipe(
        name: json['name'],
        id: json['id'],
        imageURL: json['thumbnail_url'],
        instructions: instructions,
        rating: Rating.fromMap(json['user_ratings']),
        ingredients: ingredients);
  }
*/
}
