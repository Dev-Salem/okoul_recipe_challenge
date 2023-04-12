import 'package:equatable/equatable.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/rating.dart';

class RecipeCard extends Equatable {
  final String name;
  final int id;
  final String imageURL;
  final Rating rating;

  const RecipeCard({
    required this.name,
    required this.id,
    required this.imageURL,
    required this.rating,
  });

  @override
  List<Object> get props {
    return [
      name,
      id,
      imageURL,
      rating,
    ];
  }
}
