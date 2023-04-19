import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';

class RemoveRecipeFromFavoriteUseCase {
  final BaseLocalStorageRepository _baseLocalStorageRepository;
  const RemoveRecipeFromFavoriteUseCase(this._baseLocalStorageRepository);

  call(int index) async {
    return await _baseLocalStorageRepository.removeRecipeFromFavorite(index);
  }
}
