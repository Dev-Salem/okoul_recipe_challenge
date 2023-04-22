import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/widgets/card_grid_view.dart';
import 'package:okoul_recipe_challenge/core/widgets/progress_indicator.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_states.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state.feedbackMessage != '') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.feedbackMessage),
              backgroundColor: Colors.black26,
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        //buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const CustomProgressIndicator();
            case RequestState.error:
              return Center(
                child: Text(state.errorMessage),
              );
            case RequestState.loaded:
              if (state.recipes.isEmpty) {
                return const Center(
                  child: Text("Nothing's Here"),
                );
              }
              return CardGridView(
                recipes: state.recipes,
                tabName: TabName.favorite,
              );
          }
        },
      ),
    );
  }
}
