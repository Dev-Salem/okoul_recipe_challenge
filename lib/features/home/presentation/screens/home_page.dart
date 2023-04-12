import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/widgets/tab_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(),
            SizedBox(
              height: 50,
            ),
            TabBarWidget()
          ],
        ),
      ),
    );
  }
}
