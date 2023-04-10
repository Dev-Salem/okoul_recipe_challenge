import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rating extends Equatable {
  final int countPositive;
  final int countNegative;
  final num score;
  const Rating({
    required this.countPositive,
    required this.countNegative,
    required this.score,
  });
/*
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'positiveCount': positiveCount,
      'negativeCount': negativeCount,
      'score': score,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      positiveCount: map['count_positive'] as int,
      negativeCount: map['count_negative'] as int,
      score: map['score'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);
*/

  @override
  List<Object> get props => [countPositive, countNegative, score];
}
