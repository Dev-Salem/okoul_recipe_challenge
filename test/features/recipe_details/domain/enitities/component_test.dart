import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

void main() {
  test("Test `Component` entity", () {
    const component =
        Component(ingredientDescription: "ingredientDescription", step: 0);
    expect(component.ingredientDescription, "ingredientDescription");
    expect(component.step, 0);
  });
}
