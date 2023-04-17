import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const SearchBarWidget({
    required this.textEditingController,
    super.key,
  });

  String getQueryValue() {
    return textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeFeatureBloc>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      width: double.infinity,
      height: 70,
      child: TextField(
        onSubmitted: (value) {
          print(value);
          bloc.add(GetSearchedRecipesEvent(query: value));
        },
        decoration: const InputDecoration(
          hintText: "Search Anything..",
          prefixIcon: Icon(Icons.search),
        ),
        controller: textEditingController,
      ),
    );
  }
}
