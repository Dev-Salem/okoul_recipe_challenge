import 'package:okoul_recipe_challenge/features/recipe_details/data/models/component_model.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

class SectionsModel extends Sections {
  const SectionsModel({required super.components});

  factory SectionsModel.fromJson(Map<String, dynamic> json) {
    return SectionsModel(
      components: List<ComponentModel>.from(
        (json['components'] as List<dynamic>).map<ComponentModel>(
          (x) => ComponentModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() => 'Sections(components: $components)';
}
