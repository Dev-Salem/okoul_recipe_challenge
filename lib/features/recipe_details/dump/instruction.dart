import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Instruction extends Equatable {
  final int step;
  final String description;
  const Instruction({
    required this.step,
    required this.description,
  });
/*
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'step': step,
      'description': description,
    };
  }

  factory Instruction.fromMap(Map<String, dynamic> map) {
    return Instruction(
      step: map['position'] as int,
      description: map['display_text'] as String,
    );
  }

  @override
  String toString() {
    return "$step- $description";
  }

  String toJson() => json.encode(toMap());

  factory Instruction.fromJson(String source) =>
      Instruction.fromMap(json.decode(source) as Map<String, dynamic>);
*/

  @override
  List<Object> get props => [step, description];
}
