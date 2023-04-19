// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

//part 'detailed_recipe.g.dart';

@HiveType(typeId: 0)
class HiveDetailedRecipe extends HiveObject implements DetailedRecipe {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String imageURL;

  @HiveField(2)
  @override
  final List<Instruction> instructions;

  @HiveField(3)
  @override
  final String name;

  @override
  List<Object> get props =>
      [instructions, imageURL, id, name, rating, sections];

  @HiveField(4)
  @override
  final Rating rating;

  @HiveField(5)
  @override
  final List<Sections> sections;

  HiveDetailedRecipe({
    required this.id,
    required this.imageURL,
    required this.instructions,
    required this.name,
    required this.rating,
    required this.sections,
  });

  @override
  bool? get stringify => false;
}
