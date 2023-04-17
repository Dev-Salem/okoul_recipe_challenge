import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/recipe_card_widget.dart';

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
        _scrollController.position.maxScrollExtent * 0.9) {
      if (widget.isFeed) {
        bloc.add(const GetFeedRecipesEvent());
      } else {
        bloc.add(
            GetSearchedRecipesEvent(query: widget.textEditingController!.text));
      }
    }
  }

  scrollToTheEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent / 2,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollToTheEnd();
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return RecipeCardWidget(
            name: widget.recipes[index].name,
            imageURL: widget.recipes[index].imageURL,
            rating: widget.recipes[index].rating.score);
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
