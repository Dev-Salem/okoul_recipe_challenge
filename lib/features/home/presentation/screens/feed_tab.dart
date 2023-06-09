import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/error_widget.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_controllers.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/core/widgets/card_grid_view.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatureBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        switch (state.feedRequestState) {
          case RequestState.loading:
            return const CustomProgressIndicator();
          case RequestState.error:
            return CustomErrorWidget(
                errorMessage: state.feedErrorMessage,
                onTap: () {
                  BlocProvider.of<HomeFeatureBloc>(context)
                      .add(const GetFeedRecipesEvent());
                });
          case RequestState.loaded:
            return CardGridView(
              recipes: state.feedRecipesList,
              tabName: TabName.feed,
            );
        }
      },
    );
  }
}
