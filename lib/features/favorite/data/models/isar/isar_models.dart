import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

part 'isar_models.g.dart';

@collection
class IsarDetailedRecipe {
  String? name;
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true, type: IndexType.value)
  int? recipeId;
  String? imageURL;
  IsarRating? rating;
  List<IsarInstruction>? instructions;

  List<IsarSections>? sections;

  IsarDetailedRecipe(
      {this.name = '',
      this.recipeId = 0,
      this.imageURL = '',
      this.rating,
      this.instructions = const <IsarInstruction>[],
      this.sections = const <IsarSections>[]});

  static DetailedRecipe toDetailedRecipe(IsarDetailedRecipe recipe) {
    return DetailedRecipe(
        name: recipe.name!,
        id: recipe.id,
        imageURL: recipe.imageURL!,
        rating: Rating(
            countPositive: recipe.rating!.countPositive!,
            countNegative: recipe.rating!.countNegative!,
            score: recipe.rating!.score!),
        instructions: recipe.instructions!
            .map((e) => Instruction(
                instructionDescription: e.instructionDescription!,
                step: e.step!))
            .toList(),
        sections: recipe.sections!
            .map((e) => Sections(
                components: e.components!
                    .map((c) => Component(
                        ingredientDescription: c.ingredientDescription!,
                        step: c.step!))
                    .toList()))
            .toList());
  }

  factory IsarDetailedRecipe.toIsarObject(DetailedRecipe recipe) {
    return IsarDetailedRecipe(
      name: recipe.name,
      recipeId: recipe.id,
      imageURL: recipe.imageURL,
      instructions: recipe.instructions
          .map((e) => IsarInstruction(
              instructionDescription: e.instructionDescription, step: e.step))
          .toList(),
      rating: IsarRating(
          countNegative: recipe.rating.countNegative,
          countPositive: recipe.rating.countPositive,
          score: recipe.rating.score.toDouble()),
      sections: recipe.sections
          .map((e) => IsarSections(
              components: e.components
                  .map((c) => IsarComponent(
                      ingredientDescription: c.ingredientDescription,
                      step: c.step))
                  .toList()))
          .toList(),
    );
  }
}

@embedded
class IsarInstruction {
  String? instructionDescription;
  int? step;
  IsarInstruction({this.instructionDescription = '', this.step = 0});
}

@embedded
class IsarRating {
  int? countPositive;
  int? countNegative;
  double? score;
  IsarRating({this.countPositive = 0, this.countNegative = 0, this.score = 0});
}

@embedded
class IsarComponent {
  String? ingredientDescription;
  int? step;
  IsarComponent({this.ingredientDescription = '', this.step = 0});
}

@embedded
class IsarSections {
  List<IsarComponent>? components;
  IsarSections({this.components = const []});
}
