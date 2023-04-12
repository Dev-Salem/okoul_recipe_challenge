import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient extends Equatable {
  final String name;
  final int position;

  const Ingredient({
    required this.name,
    required this.position,
  });
/*
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'position': position,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['raw_text'] as String,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    print('$position-$name');
    return super.toString();
  }
*/

  @override
  List<Object> get props => [name, position];
}
