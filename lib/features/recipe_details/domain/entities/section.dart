// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

class Sections extends Equatable {
  final List<Component> components;

  const Sections({
    required this.components,
  });
/*
 
*/

  @override
  List<Object> get props => [components];
}
