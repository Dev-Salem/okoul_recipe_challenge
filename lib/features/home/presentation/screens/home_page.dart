import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/tab_bar_view_widget.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/tab_bar_widget.dart';

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
    tabController = TabController(length: 2, vsync: this);
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
    return BlocProvider(
      create: (context) =>
          sl<HomeFeatureBloc>()..add(const GetRecipeListEvent()),
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
                child: TabBarViewWidget(
                  tabController: tabController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
