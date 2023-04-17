import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/card_grid_view.dart';

class SearchTab extends StatelessWidget {
  final TextEditingController controller;
  const SearchTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatureBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        switch (state.searchRequestState) {
          case RequestState.loading:
            return state.searchRecipesList.isEmpty
                ? const Center(child: Text("Start Searching"))
                : const CustomProgressIndicator();
          case RequestState.error:
            return Center(
              child: Text(state.searchErrorMessage),
            );
          case RequestState.loaded:
            return state.searchRecipesList.isEmpty
                ? const Center(
                    child: Text('No Recipes Were Found'),
                  )
                : CardGridView(
                    recipes: state.searchRecipesList,
                    isFeed: false,
                    textEditingController: controller,
                  );
        }
      },
    );
  }
}
