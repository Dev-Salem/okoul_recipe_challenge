// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Instruction extends Equatable {
  final String instructionDescription;
  final int step;

  const Instruction({
    required this.instructionDescription,
    required this.step,
  });
/*
  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      instructionDescription:
          json['display_text'] == null ? "" : json['display_text'] as String,
      step: json['position'] as int,
    );
  }

  @override
  String toString() =>
      'Instruction(instructionDescription: $instructionDescription, step: $step)';
*/

  @override
  List<Object> get props => [instructionDescription, step];
}
