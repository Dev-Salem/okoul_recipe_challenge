import 'package:okoul_recipe_challenge/features/recipe_details/dump/ingredient.dart';

class IngredientModel extends Ingredient {
  const IngredientModel({required super.name, required super.position});

  factory IngredientModel.fromJson(Map<String, dynamic> map) {
    return IngredientModel(
      name: map['raw_text'] as String,
      position: map['position'] as int,
    );
  }

  @override
  String toString() {
    return "#$position- $name";
  }
}
