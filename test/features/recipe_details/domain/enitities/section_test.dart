import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

void main() {
  test("Test `Section` entity", () {
    const sections = Sections(components: <Component>[]);
    expect(sections.components, isA<List<Component>>());
  });
}
