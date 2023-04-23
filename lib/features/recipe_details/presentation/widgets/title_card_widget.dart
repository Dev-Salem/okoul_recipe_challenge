import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class TitleCardWidget extends StatelessWidget {
  final String recipeName;
  final num recipeRate;
  final DetailedRecipe detailedRecipe;
  final Function() onTap;
  const TitleCardWidget(
      {super.key,
      required this.onTap,
      required this.detailedRecipe,
      required this.recipeName,
      required this.recipeRate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.height * 0.28, horizontal: size.width * 0.07),
      //padding: EdgeInsets.all(20),
      width: double.infinity,
      height: size.width * 0.25,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              recipeName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text((recipeRate * 5).toStringAsFixed(2)),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.favorite),
                  iconSize: 25,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
