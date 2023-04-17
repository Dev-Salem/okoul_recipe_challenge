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
  
*/

  @override
  List<Object> get props => [ingredientDescription, step];
}
