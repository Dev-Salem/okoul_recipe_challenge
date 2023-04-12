import 'package:okoul_recipe_challenge/features/recipe_details/dump/instruction.dart';

class InstructionModel extends Instruction {
  const InstructionModel({required super.step, required super.description});

  factory InstructionModel.fromJson(Map<String, dynamic> map) {
    return InstructionModel(
      step: map['position'] as int,
      description: map['display_text'] as String,
    );
  }

  @override
  String toString() {
    return "#$step - $description";
  }
}
