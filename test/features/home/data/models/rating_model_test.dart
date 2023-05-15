import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/data/models/rating_model.dart';

void main() {
  group("Testing From Json of Rating Model -", () {
    test('Test Form Json of Rating Model in case score is not null', () {
      final fakeJson = {"count_positive": 8, "count_negative": 4, "score": 0.5};
      final ratingModel = RatingModel.fromJson(fakeJson);
      expect(ratingModel.countNegative, 4);
      expect(ratingModel.countPositive, 8);
      expect(ratingModel.score, 0.5);
    });
    test('Test From Json of Rating Model in case score is null', () {
      final jsonWithoutScore = {
        "count_positive": 8,
        "count_negative": 4,
        "score": null
      };
      final ratingModelWithDefaultScore =
          RatingModel.fromJson(jsonWithoutScore);
      expect(ratingModelWithDefaultScore.countPositive, 8);
      expect(ratingModelWithDefaultScore.countNegative, 4);
      expect(ratingModelWithDefaultScore.score, 0);
    });
  });
}
