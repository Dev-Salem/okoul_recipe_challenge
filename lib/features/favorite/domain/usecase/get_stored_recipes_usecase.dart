import 'package:okoul_recipe_challenge/features/favorite/domain/repository/base_local_storage_repository.dart';

class GetStoredRecipesUseCase {
  final BaseLocalStorageRepository _baseLocalStorageRepository;
  const GetStoredRecipesUseCase(this._baseLocalStorageRepository);
  call() async {
    return await _baseLocalStorageRepository.getStoredRecipes();
  }
}
