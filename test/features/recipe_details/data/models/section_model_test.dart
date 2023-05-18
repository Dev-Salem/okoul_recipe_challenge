import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/data/models/section_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

void main() {
  test('Test FromJson Method of SectionModel Entity', () {
    final fakeJson = {"components": []};
    final sections = SectionsModel.fromJson(fakeJson);
    expect(sections, isA<Sections>());
    expect(sections.components, isA<List<Component>>());
  });
}
