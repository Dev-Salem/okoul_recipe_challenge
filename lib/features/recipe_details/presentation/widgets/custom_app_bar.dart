import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(children: [
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        SizedBox(
          width: size.width * 0.25,
        ),
        Text(
          'Recipe Details',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ]),
    );
  }
}
