import 'package:okoul_recipe_challenge/core/type_defs/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_search_repository.dart';

class GetRecipeListByQueryUseCase {
  final BaseSearchRepository _baseSearchRepository;
  const GetRecipeListByQueryUseCase(this._baseSearchRepository);

  EitherRecipeList call(String query) async {
    return await _baseSearchRepository.getRecipeListByQuery(query);
  }
}
