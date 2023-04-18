import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/feed_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/search_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/tab_bar_widget.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/screens/recipe_details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController textEditingController;
  late final TabController tabController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeFeatureBloc, HomeState>(
      listener: (context, state) {
        if (state is GoToRecipeDetailsState) {
          BlocProvider.of<RecipeDetailsBloc>(context)
              .add(GetRecipeDetailsEvent(state.recipeId));
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return BlocProvider<HomeFeatureBloc>.value(
              value: HomeFeatureBloc(
                  recipeListUseCase: sl(), recipeListByQueryUseCase: sl()),
              child: const RecipeDetailsScreen(),
            );
          }));
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 20,
              ),
              TabBarWidget(
                tabController: tabController,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: TabBarView(controller: tabController, children: [
                const FeedTab(),
                SearchTab(
                  controller: textEditingController,
                ),
                const Text("hi 2")
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
