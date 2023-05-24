import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/error_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_states.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/screens/loaded_recipe_details.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return const CustomProgressIndicator();
              case RequestState.error:
                return CustomErrorWidget(
                    errorMessage: state.errorMessage,
                    onTap: () {
                      BlocProvider.of<RecipeDetailsBloc>(context)
                          .add(GetRecipeDetailsEvent(state.detailedRecipe.id));
                    });
              case RequestState.loaded:
                return LoadedRecipeDetailsScreen(
                    detailedRecipe: state.detailedRecipe);
            }
          },
        ),
      ),
    );
  }
}
