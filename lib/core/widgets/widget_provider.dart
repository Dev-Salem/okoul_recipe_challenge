import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';

class WidgetProvider extends StatelessWidget {
  final Widget child;
  const WidgetProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => HomeFeatureBloc(
              recipeListUseCase: sl(), recipeListByQueryUseCase: sl())
            ..add(const GetFeedRecipesEvent())), //Feed + Search Bloc
      BlocProvider(
          create: (_) => RecipeDetailsBloc(sl())), // Recipe Details Bloc
      BlocProvider(
          create: (_) => FavoriteBloc(sl(), sl(), sl())
            ..add(const GetStoredRecipesEvent())), // Favorite tab Bloc
    ], child: child);
  }
}
