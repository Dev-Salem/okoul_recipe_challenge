import 'package:okoul_recipe_challenge/core/utils/type_defs.dart';
import 'package:okoul_recipe_challenge/features/home/domain/repository/base_home_repository.dart';

class GetRecipeListUseCase {
  final BaseHomeRepository _baseHomeRepository;
  const GetRecipeListUseCase(this._baseHomeRepository);

  EitherRecipeList call(int from, int to) async {
    return await _baseHomeRepository.getRecipeList(from, to);
  }
}
