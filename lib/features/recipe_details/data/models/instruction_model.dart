import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';

class InstructionModel extends Instruction {
  const InstructionModel(
      {required super.instructionDescription, required super.step});

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      instructionDescription: json['display_text'] as String,
      step: json['position'] as int,
    );
  }
}
