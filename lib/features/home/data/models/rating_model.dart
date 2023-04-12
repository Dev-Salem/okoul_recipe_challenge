import 'package:okoul_recipe_challenge/features/home/domain/entities/rating.dart';

class RatingModel extends Rating {
  const RatingModel(
      {required super.countPositive,
      required super.countNegative,
      required super.score});

  factory RatingModel.fromJson(Map<String, dynamic> map) {
    return RatingModel(
      countPositive: map['count_positive'] as int,
      countNegative: map['count_negative'] as int,
      score: map['score'] as num,
    );
  }

  @override
  String toString() {
    return "PositiveReview: $countPositive, Negative: $countNegative, Score: $score";
  }
}
