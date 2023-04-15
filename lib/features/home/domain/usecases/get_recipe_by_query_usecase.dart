import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class GetRecipeListByQueryUseCase {
  final BaseHomeRepository _baseHomeRepository;
  const GetRecipeListByQueryUseCase(this._baseHomeRepository);

  EitherRecipeList call(String query, int from, int to) async {
    return await _baseHomeRepository.getRecipeListByQuery(query, from, to);
  }
}
