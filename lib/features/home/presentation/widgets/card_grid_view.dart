import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/recipe_card_widget.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/screens/recipe_details_screen.dart';

class CardGridView extends StatefulWidget {
  final List<RecipeCard> recipes;
  final bool isFeed;
  final TextEditingController? textEditingController;
  const CardGridView(
      {super.key,
      required this.recipes,
      required this.isFeed,
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
      if (widget.isFeed) {
        bloc.add(const GetFeedRecipesEvent());
      } else {
        bloc.add(
            GetSearchedRecipesEvent(query: widget.textEditingController!.text));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: widget.isFeed
          ? const PageStorageKey(0)
          : const PageStorageKey(
              1), //Save the location of the scrolling position
      controller: _scrollController,
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            BlocProvider.of<RecipeDetailsBloc>(context)
                .add(GetRecipeDetailsEvent(widget.recipes[index].id));
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RecipeDetailsScreen()));
          },
          child: RecipeCardWidget(
              name: widget.recipes[index].name,
              imageURL: widget.recipes[index].imageURL,
              rating: widget.recipes[index].rating.score),
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
