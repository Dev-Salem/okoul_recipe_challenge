import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/core/utils/constants.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/component.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/instruction.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/rating.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/section.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  registerAdapters();
  runApp(const MyApp());
  ServiceLocator().init();
}

registerAdapters() {
  Hive
    ..registerAdapter(HiveDetailedRecipeAdapter())
    ..registerAdapter(HiveRatingAdapter())
    ..registerAdapter(HiveComponentAdapter())
    ..registerAdapter(HiveInstructionAdapter())
    ..registerAdapter(HiveSectionsAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => HomeFeatureBloc(
                recipeListUseCase: sl(), recipeListByQueryUseCase: sl())
              ..add(const GetFeedRecipesEvent())), //Feed + Search Bloc
        BlocProvider(
            create: (_) => RecipeDetailsBloc(sl())), // Recipe Details Bloc
        BlocProvider(
            create: (_) => FavoriteBloc(sl(), sl(), sl())
              ..add(const GetStoredRecipesEvent())), // Favorite tab Bloc
      ],
      child: MaterialApp(
        home: const HomePage(),
        theme: customTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
