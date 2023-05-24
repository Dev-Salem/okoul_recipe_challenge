import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/instruction_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';

void main() {
  test('Test From Json Method of InstructionModel entity', () {
    final instruction = InstructionModel.fromJson(instructionMapObject);
    expect(instruction, isA<Instruction>());
    expect(instruction.instructionDescription, 'Cut the veggies');
    expect(instruction.step, 0);
  });
}
