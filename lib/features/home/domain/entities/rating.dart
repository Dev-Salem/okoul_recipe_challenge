import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final int countPositive;
  final int countNegative;
  final num score;
  const Rating({
    required this.countPositive,
    required this.countNegative,
    required this.score,
  });

  @override
  List<Object> get props => [
        countPositive,
        countNegative,
      ];
}
