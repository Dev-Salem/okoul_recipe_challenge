import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/error_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_controllers.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/core/widgets/card_grid_view.dart';

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
            return const CustomProgressIndicator();
          case RequestState.error:
            return CustomErrorWidget(
                errorMessage: state.searchErrorMessage,
                onTap: () {
                  BlocProvider.of<HomeFeatureBloc>(context)
                      .add(GetSearchedRecipesEvent(query: controller.text));
                });
          case RequestState.loaded:
            return state.searchRecipesList.isEmpty
                ? const Center(
                    child: Text("Nothing's Here, Start Searching"),
                  )
                : CardGridView(
                    recipes: state.searchRecipesList,
                    tabName: TabName.search,
                    textEditingController: controller,
                  );
        }
      },
    );
  }
}
