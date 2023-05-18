import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/rating_model.dart';

void main() {
  group("Testing From Json of Rating Model -", () {
    test('Test Form Json of Rating Model in case score is not null', () {
      final ratingModel = RatingModel.fromJson(ratingMapObject);
      expect(ratingModel.countNegative, 4);
      expect(ratingModel.countPositive, 8);
      expect(ratingModel.score, 0.5);
    });
    test('Test From Json of Rating Model in case score is null', () {
      final ratingModelWithDefaultScore =
          RatingModel.fromJson(ratingWithoutNullMapObject);
      expect(ratingModelWithDefaultScore.countPositive, 8);
      expect(ratingModelWithDefaultScore.countNegative, 4);
      expect(ratingModelWithDefaultScore.score, 0);
    });
  });
}
