import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_bloc.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_events.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  //await Hive.initFlutter();
  //await Hive.openBox('recipes');
  runApp(const MyApp());
  ServiceLocator().init();
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
              ..add(const GetFeedRecipesEvent())),
        BlocProvider(create: (_) => RecipeDetailsBloc(sl()))
      ],
      child: MaterialApp(
        home: const HomePage(),
        theme: customTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
