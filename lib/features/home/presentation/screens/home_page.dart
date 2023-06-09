import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/screens/favorite_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/feed_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/search_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/search_bar_widget.dart';
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
    tabController = TabController(length: 3, vsync: this, initialIndex: 2);
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
    return SafeArea(
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
              const FavoriteTab()
            ]))
          ],
        ),
      ),
    );
  }
}
