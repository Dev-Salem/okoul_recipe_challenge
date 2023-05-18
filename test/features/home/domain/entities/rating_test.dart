import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

void main() {
  test('Test Rating Entity', () {
    expect(rating.countNegative, 9);
    expect(rating.countPositive, 5);
    expect(rating.score, 0.8);
  });
}
