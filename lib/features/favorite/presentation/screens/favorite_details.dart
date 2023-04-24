import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoul_recipe_challenge/core/widgets/cached_image_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_details_component/exports.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_controllers.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class FavoriteDetails extends StatelessWidget {
  final DetailedRecipe recipe;
  const FavoriteDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: size.width * 0.7,
                width: double.infinity,
                child: CachedImageWidget(imageURL: recipe.imageURL),
              ),
              const ImageShadowWidget(),
              const CustomAppBar(),
              TitleCardWidget(
                  onTap: () async {
                    //remove the recipe from the database and delete the cached image
                    Fluttertoast.showToast(
                        msg: "Recipe has been removed from favorite");
                    BlocProvider.of<FavoriteBloc>(context)
                        .add(RemoveRecipeFromFavoriteEvent(index: recipe.id));
                    await DefaultCacheManager().removeFile(recipe.imageURL);
                  },
                  recipeName: recipe.name,
                  recipeRate: recipe.rating.score),
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
                          ingredients: recipe.sections[0].components),
                      const SizedBox(
                        height: 20,
                      ),
                      InstructionsCardWidget(instructions: recipe.instructions),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
