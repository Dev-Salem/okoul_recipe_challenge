import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/recipe_card_widget.dart';

class TabBarViewWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarViewWidget({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: tabController, children: [
      BlocBuilder<HomeFeatureBloc, HomeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          bool isFeed = state.page == ShowResult.feed;
          switch (isFeed
              ? state.recipeCardsListState
              : state.recipeCardsByQueryState) {
            case RequestState.loading:
              return const SizedBox(
                height: 400,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestState.error:
              return Center(
                  child: Text(
                isFeed
                    ? state.recipeCardsListErrorMessage
                    : state.recipeCardsByQueryMessage,
                style: const TextStyle(fontSize: 50),
              ));

            case RequestState.loaded:
              return CardItems(
                  recipes: isFeed
                      ? state.recipeCardsList
                      : state.recipeCardsByQuery);
            case RequestState.noItems:
              Fluttertoast.showToast(msg: "No More Recipes Left");
              return CardItems(
                  recipes: isFeed
                      ? state.recipeCardsList
                      : state.recipeCardsByQuery);
          }
        },
      ),
      const Text('HI 2')
    ]);
  }
}

class CardItems extends StatefulWidget {
  final List<RecipeCard> recipes;
  const CardItems({super.key, required this.recipes});

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      Future.delayed(const Duration(seconds: 10), () {
        BlocProvider.of<HomeFeatureBloc>(context)
            .add(const GetRecipeListEvent());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) => RecipeCardWidget(
          name: widget.recipes[index].name,
          imageURL: widget.recipes[index].imageURL,
          rating: widget.recipes[index].rating.score),
      addRepaintBoundaries: false,
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
