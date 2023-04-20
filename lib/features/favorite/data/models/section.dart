// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

part 'section.g.dart';

@HiveType(typeId: 2)
class HiveSections extends HiveObject implements Sections {
  @HiveField(0)
  @override
  final List<Component> components;

  HiveSections({
    required this.components,
  });

  @override
  List<Object> get props => [components];

  @override
  bool? get stringify => false;
}
