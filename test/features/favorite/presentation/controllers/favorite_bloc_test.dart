import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_bloc.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_events.dart';
import 'package:okoul_recipe_challenge/features/favorite/presentation/controllers/favorite_states.dart';

class MockFavoriteBloc extends MockBloc<FavoriteEvents, FavoriteState>
    implements FavoriteBloc {}

void main() {
  late MockFavoriteBloc mockBloc;
  setUp(() {
    mockBloc = MockFavoriteBloc();
  });
  tearDown(() {
    mockBloc.close();
  });
  group("Test Favorite Bloc -", () {
    blocTest(
      "The initial state of the bloc should be FavoriteState()",
      setUp: () {
        whenListen(mockBloc, Stream.value(const FavoriteState()));
      },
      build: () => mockBloc,
      expect: () => [const FavoriteState()],
    );
    blocTest(
      '''When getStoredRecipeEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.loaded, recipes: [...]) is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                  requestState: RequestState.loaded, recipes: detailedRecipes)
            ]));
      },
      build: () => mockBloc,
      act: (bloc) => mockBloc.add(const GetStoredRecipesEvent()),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
            requestState: RequestState.loaded, recipes: detailedRecipes)
      ],
    );

    blocTest(
      '''When GetStoredRecipeEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.error, errorMessage:"Error") is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                  requestState: RequestState.error, errorMessage: "Error")
            ]));
      },
      build: () => mockBloc,
      act: (bloc) => mockBloc.add(const GetStoredRecipesEvent()),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
            requestState: RequestState.error, errorMessage: "Error")
      ],
    );

    blocTest(
      '''When AddRecipeToFavoriteEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.loaded,) is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                requestState: RequestState.loaded,
              )
            ]));
      },
      build: () => mockBloc,
      act: (bloc) =>
          mockBloc.add(const AddRecipeToFavoriteEvent(recipe: detailedRecipe)),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
          requestState: RequestState.loaded,
        )
      ],
    );

    blocTest(
      '''When AddRecipeToFavoriteEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.error, errorMessage:"Error") is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                  requestState: RequestState.error, errorMessage: "Error")
            ]));
      },
      build: () => mockBloc,
      act: (bloc) =>
          mockBloc.add(const AddRecipeToFavoriteEvent(recipe: detailedRecipe)),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
            requestState: RequestState.error, errorMessage: "Error")
      ],
    );

    blocTest(
      '''When RemoveRecipeFromFavoriteEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.loaded,) is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                requestState: RequestState.loaded,
              )
            ]));
      },
      build: () => mockBloc,
      act: (bloc) =>
          mockBloc.add(const RemoveRecipeFromFavoriteEvent(index: 0)),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
          requestState: RequestState.loaded,
        )
      ],
    );

    blocTest(
      '''When RemoveRecipeFromFavoriteEvent is added, Stream of
       FavoriteState(requestState:RequestState.loading) and 
       FavoriteState(requestState:RequestState.error, errorMessage:"Error") is expected''',
      setUp: () {
        whenListen(
            mockBloc,
            Stream.fromIterable([
              const FavoriteState(),
              const FavoriteState(
                  requestState: RequestState.error, errorMessage: "Error")
            ]));
      },
      build: () => mockBloc,
      act: (bloc) =>
          mockBloc.add(const RemoveRecipeFromFavoriteEvent(index: 0)),
      expect: () => [
        const FavoriteState(),
        const FavoriteState(
            requestState: RequestState.error, errorMessage: "Error")
      ],
    );
  });
}
