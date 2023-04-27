import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/onboarding_screen/screens/onboarding_screen_template.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late final PageController _controller;
  int index = 0;
  @override
  void initState() {
    _controller = PageController();
    changeFirstLaunch();
    super.initState();
  }

  void changeFirstLaunch() async {
    final sharePref = await SharedPreferences.getInstance();
    await sharePref.setBool("isFirstLaunch", false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            onPageChanged: (value) => index = value,
            controller: _controller,
            children: const [
              OnboardingScreenTemplateScreen(
                  color: Colors.green,
                  imagePath: "assets/dish_1.png",
                  slogan: "Discover Amazing Recipes"),
              OnboardingScreenTemplateScreen(
                  color: Colors.red,
                  imagePath: "assets/dish_2.png",
                  slogan: "Search By Ingredients Or Name"),
              OnboardingScreenTemplateScreen(
                  color: Colors.orange,
                  imagePath: "assets/dsih_3.png",
                  slogan: "Save Your Favorite Recipes"),
            ],
          ),
          Positioned(
              bottom: 80,
              left: MediaQuery.of(context).size.width * 0.4,
              child: TextButton(
                  onPressed: () {
                    if (index == 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    } else {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      )),
    );
  }
}
