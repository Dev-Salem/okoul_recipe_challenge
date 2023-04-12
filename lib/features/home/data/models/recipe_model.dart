import 'package:okoul_recipe_challenge/features/home/data/models/rating_model.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

class RecipeCardModel extends RecipeCard {
  const RecipeCardModel({
    required super.name,
    required super.id,
    required super.imageURL,
    required super.rating,
  });

  factory RecipeCardModel.formJson(Map<String, dynamic> json) {
    return RecipeCardModel(
      name: json['name'],
      id: json['id'],
      imageURL: json['thumbnail_url'],
      rating: json['user_ratings'] == null
          ? const Rating(countPositive: 0, countNegative: 0, score: 0)
          : RatingModel.fromJson(json['user_ratings']),
    );
  }

  @override
  String toString() =>
      "Name: $name, ID:$id, ImageURL:$imageURL, rating: $rating,";
}
