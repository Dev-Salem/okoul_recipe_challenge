// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Instruction extends Equatable {
  final String instructionDescription;
  final int step;

  const Instruction({
    required this.instructionDescription,
    required this.step,
  });

  @override
  List<Object> get props => [instructionDescription, step];
}
