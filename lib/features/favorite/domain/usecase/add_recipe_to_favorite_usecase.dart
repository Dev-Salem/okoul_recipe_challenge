import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';

class AddRecipeToFavoriteUseCase {
  final BaseLocalStorageRepository _baseLocalStorageRepository;
  const AddRecipeToFavoriteUseCase(this._baseLocalStorageRepository);

  call(DetailedRecipe recipe) async {
    return await _baseLocalStorageRepository.addRecipeToFavorite(recipe);
  }
}
