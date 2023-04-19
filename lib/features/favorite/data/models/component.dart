// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

//part 'component.g.dart';

@HiveType(typeId: 3)
class HiveComponent extends HiveObject implements Component {
  @HiveField(0)
  @override
  final String ingredientDescription;

  @override
  List<Object> get props => [ingredientDescription];

  @HiveField(1)
  @override
  final int step;

  HiveComponent({
    required this.ingredientDescription,
    required this.step,
  });

  @override
  bool? get stringify => false;
}
