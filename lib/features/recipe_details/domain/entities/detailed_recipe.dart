// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:okoul_recipe_challenge/features/home/data/models/rating_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

class DetailedRecipe extends RecipeCard {
  final List<Sections> sections;
  final List<Instruction> instructions;

  const DetailedRecipe(
      {required super.name,
      required super.id,
      required super.imageURL,
      required super.rating,
      required this.instructions,
      required this.sections});

/*
  factory DetailedRecipe.fromJson(Map<String, dynamic> json) {
    return DetailedRecipe(
      name: json['name'],
      id: json['id'],
      imageURL: json['thumbnail_url'],
      rating: json['user_ratings'] == null
          ? const Rating(countPositive: 0, countNegative: 0, score: 0)
          : RatingModel.fromJson(json['user_ratings']),
      sections: List<Sections>.from(
        (json['sections'] as List<dynamic>).map<Sections>(
          (x) => Sections.fromJson(x as Map<String, dynamic>),
        ),
      ),
      instructions: List<Instruction>.from(
        (json['instructions'] as List<dynamic>).map<Instruction>(
          (x) => Instruction.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() =>
      'name: $name \n id: $id \n imageURL: $imageURL \n $rating\n instructions: $instructions \n $sections $sections';
*/
}
