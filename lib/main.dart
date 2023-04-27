import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/isar/isar_models.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/onboarding_screen/page_view.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/favorite/presentation/controllers/favorite_controllers.dart';
import 'features/home/presentation/controllers/home_controllers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirstLaunch = await initOnBoardingScreen();
  await _createIsarInstance();
  ServiceLocator().init();
  runApp(MyApp(
    isFirstLaunch: isFirstLaunch,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

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
        home:
            isFirstLaunch == false ? const HomePage() : const PageViewWidget(),
        theme: customTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

Future<void> _createIsarInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open([IsarDetailedRecipeSchema], directory: dir.path);
}

Future<bool?> initOnBoardingScreen() async {
  final sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getBool("isFirstLaunch");
}
