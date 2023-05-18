import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_bloc.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_events.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/presentation/controllers/recipe_details_states.dart';

class MockRecipeDetailsBloc
    extends MockBloc<RecipeDetailsEvents, RecipeDetailsState>
    implements RecipeDetailsBloc {}

void main() {
  final mockBloc = MockRecipeDetailsBloc();
  group('Test Recipe Details Bloc -', () {
    blocTest(
      "The initial value of the bloc should be RecipeDetailsState()",
      setUp: () {
        whenListen(mockBloc, Stream.value(const RecipeDetailsState()));
      },
      build: () => mockBloc,
      expect: () => [const RecipeDetailsState()],
    );

    blocTest(
      '''When GetRecipeDetailsEvent is added, a state of RecipeDetailsState
    which has RequestState.loaded, recipeDetails = [...] is expected
    ''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const RecipeDetailsState(requestState: RequestState.loading),
              const RecipeDetailsState(
                  requestState: RequestState.loaded,
                  detailedRecipe: detailedRecipe)
            ]));
      },
      build: () => mockBloc,
      act: (bloc) => bloc.add(const GetRecipeDetailsEvent(0)),
      expect: () => [
        const RecipeDetailsState(requestState: RequestState.loading),
        const RecipeDetailsState(
            requestState: RequestState.loaded, detailedRecipe: detailedRecipe)
      ],
    );

    blocTest(
      '''When GetRecipeDetailsEvent is added, a state of RecipeDetailsState
    which has RequestState.error and errorMessage = "Error" is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const RecipeDetailsState(requestState: RequestState.loading),
              const RecipeDetailsState(
                  requestState: RequestState.error, errorMessage: "Error")
            ]));
      },
      build: () => mockBloc,
      act: (bloc) => bloc.add(const GetRecipeDetailsEvent(0)),
      expect: () => [
        const RecipeDetailsState(requestState: RequestState.loading),
        const RecipeDetailsState(
            requestState: RequestState.error, errorMessage: "Error")
      ],
    );
  });
}
