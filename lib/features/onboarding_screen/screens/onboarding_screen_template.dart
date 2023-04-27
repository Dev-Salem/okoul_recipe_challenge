import 'package:flutter/material.dart';

class OnboardingScreenTemplateScreen extends StatelessWidget {
  final MaterialColor color;
  final String imagePath;
  final String slogan;
  const OnboardingScreenTemplateScreen(
      {super.key,
      required this.color,
      required this.imagePath,
      required this.slogan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color[100],
      body: Stack(
        children: [
          Positioned(
            left: 100,
            top: -50,
            height: 400,
            child: Image.asset(imagePath),
          ),
          Positioned(
            bottom: 200,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                slogan,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: color[800]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
