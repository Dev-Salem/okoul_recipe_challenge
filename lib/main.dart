import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/isar/isar_models.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'features/favorite/presentation/controllers/favorite_controllers.dart';
import 'features/home/presentation/controllers/home_controllers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _createIsarInstance();
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

Future<void> _createIsarInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open([IsarDetailedRecipeSchema], directory: dir.path);
}
