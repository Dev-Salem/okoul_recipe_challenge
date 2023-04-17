// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  
*/
}
