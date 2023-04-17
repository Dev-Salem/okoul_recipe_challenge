// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Component extends Equatable {
  final String ingredientDescription;
  final int step;

  const Component({
    required this.ingredientDescription,
    required this.step,
  });
/*
  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      ingredientDescription:
          json['raw_text'] == null ? "" : json['raw_text'] as String,
      step: json['position'] as int,
    );
  }

  @override
  String toString() =>
      'Component(ingredientDescription: $ingredientDescription, step: $step)';
*/

  @override
  List<Object> get props => [ingredientDescription, step];
}
