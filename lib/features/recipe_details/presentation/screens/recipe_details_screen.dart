import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/exports.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_states.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return const CustomProgressIndicator();
              case RequestState.error:
                return Center(child: Text(state.errorMessage));
              case RequestState.loaded:
                final ingredients = state.detailedRecipe.sections[0].components;
                final instructions = state.detailedRecipe.instructions;

                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      ImageWidget(imageURL: state.detailedRecipe.imageURL),
                      const ImageShadowWidget(),
                      const CustomAppBar(),
                      TitleCardWidget(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Recipe has been added to favorite");
                            BlocProvider.of<FavoriteBloc>(context).add(
                                AddRecipeToFavoriteEvent(
                                    recipe: state.detailedRecipe));
                          },
                          recipeName: state.detailedRecipe.name,
                          recipeRate: state.detailedRecipe.rating.score),
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
                              IngredientsCardWidget(ingredients: ingredients),
                              const SizedBox(
                                height: 20,
                              ),
                              InstructionsCardWidget(
                                  instructions: instructions),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
