import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

class ComponentModel extends Component {
  const ComponentModel(
      {required super.ingredientDescription, required super.step});

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      ingredientDescription: json['raw_text'] as String,
      step: json['position'] as int,
    );
  }

  @override
  String toString() =>
      'Component(ingredientDescription: $ingredientDescription, step: $step)';
}
