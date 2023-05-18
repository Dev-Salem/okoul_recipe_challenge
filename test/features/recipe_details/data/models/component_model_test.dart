import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/component_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

void main() {
  test('Test FromJson Method of ComponentModel Entity', () {
    final fakeJson = {"raw_text": "Fresh Chickpeas", "position": 0};
    final component = ComponentModel.fromJson(fakeJson);
    expect(component, isA<Component>());
    expect(component.ingredientDescription, "Fresh Chickpeas");
    expect(component.step, 0);
  });
}
