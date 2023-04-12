import 'package:okoul_recipe_challenge/core/type_defs/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_search_repository.dart';

class GetRecipeListUseCase {
  final BaseSearchRepository _baseSearchRepository;
  const GetRecipeListUseCase(this._baseSearchRepository);

  EitherRecipeList call() async {
    return await _baseSearchRepository.getRecipeList();
  }
}
