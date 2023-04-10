import 'package:okoul_recipe_challenge/core/type_defs/type_defs.dart';
import 'package:okoul_recipe_challenge/features/search/domain/repository/base_search_repository.dart';

abstract class GetRecipeFromNameUseCase {
  final BaseSearchRepository _baseSearchRepository;
  const GetRecipeFromNameUseCase(this._baseSearchRepository);

  EitherRecipeList call() async {
    return await _baseSearchRepository.getRecipeFromName();
  }
}
