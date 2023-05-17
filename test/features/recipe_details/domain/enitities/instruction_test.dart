import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';

void main() {
  test('Test `Instruction` entity', () {
    const instruction =
        Instruction(instructionDescription: "instructionDescription", step: 0);
    expect(instruction.instructionDescription, "instructionDescription");
    expect(instruction.step, 0);
  });
}
