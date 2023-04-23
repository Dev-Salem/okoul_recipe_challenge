import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';

class RecipeCardWidget extends StatelessWidget {
  final RecipeCard recipeCard;
  const RecipeCardWidget({required this.recipeCard, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height / 3.5;
    final cardWidth = size.width / 2.3;
    return Container(
      margin: const EdgeInsets.all(7),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: cardHeight * 0.7,
            width: cardWidth,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Image.network(
              recipeCard.imageURL,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Text("Error $error"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Text(
                  (recipeCard.rating.score * 5).toStringAsFixed(2),
                  style: const TextStyle(fontSize: 20),
                ),
                // const Expanded(child: SizedBox()),
                // //Add Favorite Button to the card if time there's enough time
                // InkWell(
                //   onTap: () {
                //     // BlocProvider.of<FavoriteBloc>(context)
                //     //     .add(AddRecipeToFavoriteEvent(recipe: recipeCard));
                //   },
                //   child: const Icon(
                //     Icons.favorite,
                //     size: 25,
                //     color: Colors.red,
                //   ),
                // ),
                // const SizedBox(
                //   width: 3,
                // )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: Text(
              recipeCard.name,
              style: const TextStyle(fontSize: 17, shadows: [
                BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 10)
              ]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
        ],
      ),
    );
  }
}
