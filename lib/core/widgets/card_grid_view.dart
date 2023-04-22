import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/screens/favorite_details.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/core/widgets/recipe_card_widget.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/screens/recipe_details_screen.dart';

class CardGridView extends StatefulWidget {
  final dynamic recipes;
  final TabName tabName;
  final TextEditingController? textEditingController;
  const CardGridView(
      {super.key,
      required this.tabName,
      required this.recipes,
      this.textEditingController});

  @override
  State<CardGridView> createState() => _CardGridViewState();
}

class _CardGridViewState extends State<CardGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() async {
    final bloc = BlocProvider.of<HomeFeatureBloc>(context);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.95) {
      //when the user reaches 95% of the page, retrieve more recipes
      if (widget.tabName == TabName.feed) {
        bloc.add(const GetFeedRecipesEvent());
      } else if (widget.tabName == TabName.search) {
        bloc.add(
            GetSearchedRecipesEvent(query: widget.textEditingController!.text));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: widget.tabName == TabName.feed
          ? const PageStorageKey(0)
          : widget.tabName == TabName.search
              ? const PageStorageKey(1)
              : const PageStorageKey(
                  2), //Save the location of the scrolling position
      controller: _scrollController,
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: widget.tabName == TabName.favorite
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          FavoriteDetails(recipe: widget.recipes[index])));
                }
              : () {
                  BlocProvider.of<RecipeDetailsBloc>(context)
                      .add(GetRecipeDetailsEvent(widget.recipes[index].id));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const RecipeDetailsScreen()));
                },
          child: RecipeCardWidget(
            recipeCard: widget.recipes[index],
          ),
        );
      },
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
