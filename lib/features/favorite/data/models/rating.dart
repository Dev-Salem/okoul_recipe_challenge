// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/rating.dart';

part 'rating.g.dart';

@HiveType(typeId: 4)
class HiveRating extends HiveObject implements Rating {
  @HiveField(0)
  @override
  final int countNegative;

  @HiveField(1)
  @override
  final int countPositive;

  @override
  List<Object> get props => [countPositive, countNegative, score];

  @HiveField(2)
  @override
  final int score;

  HiveRating({
    required this.countNegative,
    required this.countPositive,
    required this.score,
  });

  @override
  bool? get stringify => false;
}
