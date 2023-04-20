// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';

part 'instruction.g.dart';

@HiveType(typeId: 1)
class HiveInstruction extends HiveObject implements Instruction {
  @HiveField(0)
  @override
  final String instructionDescription;

  @override
  List<Object> get props => [instructionDescription, step];

  @HiveField(1)
  @override
  final int step;

  HiveInstruction({
    required this.instructionDescription,
    required this.step,
  });

  @override
  bool? get stringify => false;
}
