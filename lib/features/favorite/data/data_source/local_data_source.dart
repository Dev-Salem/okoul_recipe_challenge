import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/core/utils/constants.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class BaseLocalDataSource {
  const BaseLocalDataSource();
  List<DetailedRecipe> getStoredRecipes();
  Future<Unit> addRecipeToFavorite(DetailedRecipe recipe);
  Future<Unit> removeRecipeFromFavorite(int index);
}

class HiveLocalDataSource extends BaseLocalDataSource {
  final box = Hive.box(boxName);

  @override
  Future<Unit> addRecipeToFavorite(DetailedRecipe recipe) async {
    await box.add(recipe).onError((error, stackTrace) {
      throw StorageException(errorMessage: error.toString());
    });
    return unit;
  }

  @override
  List<DetailedRecipe> getStoredRecipes() {
    final result = box.values;
    return List<DetailedRecipe>.from(result);
  }

  @override
  Future<Unit> removeRecipeFromFavorite(int index) async {
    await box.deleteAt(index);
    return unit;
  }
}
