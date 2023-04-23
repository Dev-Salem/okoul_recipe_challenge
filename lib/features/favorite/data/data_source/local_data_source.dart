import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:okoul_recipe_challenge/core/errors/exception.dart';
import 'package:okoul_recipe_challenge/features/favorite/data/models/isar/isar_models.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

abstract class BaseLocalDataSource {
  const BaseLocalDataSource();
  Future<List<DetailedRecipe>> getStoredRecipes();
  Future<Unit> addRecipeToFavorite(DetailedRecipe recipe);
  Future<Unit> removeRecipeFromFavorite(int index);
}

class HiveLocalDataSource extends BaseLocalDataSource {
  final instance = Isar.getInstance()!;
  @override
  Future<Unit> addRecipeToFavorite(DetailedRecipe recipe) async {
    final isarObject = IsarDetailedRecipe.toIsarObject(recipe);
    final recipeNotRepeated =
        await instance.isarDetailedRecipes.getByRecipeId(recipe.id) == null;
    instance.writeTxn(() async {
      if (recipeNotRepeated) {
        await instance.isarDetailedRecipes.put(isarObject);
      }
    }).onError((error, stackTrace) {
      throw StorageException(errorMessage: error.toString());
    });
    return unit;
  }

  @override
  Future<List<DetailedRecipe>> getStoredRecipes() async {
    final result = await instance.isarDetailedRecipes.where().findAll();
    return result.map((e) {
      return IsarDetailedRecipe.toDetailedRecipe(e);
    }).toList();
  }

  @override
  Future<Unit> removeRecipeFromFavorite(int index) async {
    instance.writeTxn(() async {
      await instance.isarDetailedRecipes.delete(index);
    }).onError((error, stackTrace) {
      throw StorageException(errorMessage: error.toString());
    });
    return unit;
  }
}
