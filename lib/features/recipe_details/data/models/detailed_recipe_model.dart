import 'package:okoul_recipe_challenge/features/home/data/models/rating_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/instruction_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/section_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class DetailedRecipeModel extends DetailedRecipe {
  const DetailedRecipeModel(
      {required super.name,
      required super.id,
      required super.imageURL,
      required super.rating,
      required super.instructions,
      required super.sections});

  factory DetailedRecipeModel.fromJson(Map<String, dynamic> json) {
    return DetailedRecipeModel(
      name: json['name'],
      id: json['id'],
      imageURL: json['thumbnail_url'],
      rating: json['user_ratings'] == null
          ? const RatingModel(countPositive: 0, countNegative: 0, score: 0)
          : RatingModel.fromJson(json['user_ratings']),
      sections: List<SectionsModel>.from(
        (json['sections'] as List<dynamic>).map<SectionsModel>(
          (x) => SectionsModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      instructions: List<InstructionModel>.from(
        (json['instructions'] as List<dynamic>).map<InstructionModel>(
          (x) => InstructionModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() =>
      'name: $name \n id: $id \n imageURL: $imageURL \n $rating\n instructions: $instructions \n $sections $sections';
}
