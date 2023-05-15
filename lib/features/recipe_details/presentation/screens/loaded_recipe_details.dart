import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/custom_app_bar.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/image_shadow_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/image_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/ingredients_card_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/instructions_card_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/title_card_widget.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class LoadedRecipeDetailsScreen extends StatelessWidget {
  final DetailedRecipe detailedRecipe;

  const LoadedRecipeDetailsScreen({super.key, required this.detailedRecipe});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          ImageWidget(imageURL: detailedRecipe.imageURL),
          const ImageShadowWidget(),
          const CustomAppBar(),
          TitleCardWidget(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Recipe has been added to favorite");
                BlocProvider.of<FavoriteBloc>(context)
                    .add(AddRecipeToFavoriteEvent(recipe: detailedRecipe));
              },
              recipeName: detailedRecipe.name,
              recipeRate: detailedRecipe.rating.score),
          Container(
            margin: EdgeInsets.only(
                right: size.width * 0.07,
                left: size.width * 0.07,
                top: size.height * 0.42,
                bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IngredientsCardWidget(
                      ingredients: detailedRecipe.sections[0].components),
                  const SizedBox(
                    height: 20,
                  ),
                  InstructionsCardWidget(
                      instructions: detailedRecipe.instructions),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
