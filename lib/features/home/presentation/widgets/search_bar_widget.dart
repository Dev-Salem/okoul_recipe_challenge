import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const SearchBarWidget({
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      width: double.infinity,
      height: 70,
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Search Anything..",
          prefixIcon: Icon(Icons.search),
        ),
        controller: textEditingController,
      ),
    );
  }
}
