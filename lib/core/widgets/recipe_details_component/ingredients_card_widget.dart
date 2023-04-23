import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';

class IngredientsCardWidget extends StatelessWidget {
  final List<Component> ingredients;
  const IngredientsCardWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.local_dining),
            SizedBox(
              width: 5,
            ),
            Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.8),
        ),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Text(
                    "* ${ingredients[index].ingredientDescription} \n",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )),
        ),
      ],
    );
  }
}
