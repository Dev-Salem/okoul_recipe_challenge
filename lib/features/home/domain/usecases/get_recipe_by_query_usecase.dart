import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class GetRecipeListByQueryUseCase {
  final BaseHomeRepository _baseSearchRepository;
  const GetRecipeListByQueryUseCase(this._baseSearchRepository);

  EitherRecipeList call(String query) async {
    return await _baseSearchRepository.getRecipeListByQuery(query);
  }
}
