import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/core/services/service_locator.dart';
import 'package:okoul_recipe_challenge/core/theme/custom_theme.dart';
import 'package:okoul_recipe_challenge/core/widgets/widget_provider.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/isar/isar_models.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';
import 'package:okoul_recipe_challenge/features/onboarding_screen/page_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return WidgetProvider(
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
