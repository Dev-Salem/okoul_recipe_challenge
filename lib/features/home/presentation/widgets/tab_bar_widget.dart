import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarWidget({
    required this.tabController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TabBar(controller: tabController, tabs: [
        Container(
            alignment: Alignment.center,
            width: 110,
            height: 100,
            child: const Text(
              "Home Page",
            )),
        Container(
            alignment: Alignment.center,
            width: 90,
            height: 100,
            child: const Text("Favorite"))
      ]),
    );
  }
}
