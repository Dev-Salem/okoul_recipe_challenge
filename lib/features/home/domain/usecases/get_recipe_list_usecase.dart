import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class GetRecipeListUseCase {
  final BaseHomeRepository _baseSearchRepository;
  const GetRecipeListUseCase(this._baseSearchRepository);

  EitherRecipeList call() async {
    return await _baseSearchRepository.getRecipeList();
  }
}
