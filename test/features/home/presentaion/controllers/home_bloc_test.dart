import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/core/utils/enums.dart';
import 'package:okoul_recipe_challenge/core/utils/samples.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/entities.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_controllers.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';

class MockHomeFeatureBloc extends MockBloc<HomeEvents, HomeState>
    implements HomeFeatureBloc {}

void main() {
  final MockHomeFeatureBloc mockBloc = MockHomeFeatureBloc();
  group("Test HomeFeatureBloc -", () {
    blocTest("The initial value of the bloc should be HomeState ",
        setUp: () {
          whenListen(
            mockBloc,
            Stream.value(const HomeState()),
          );
        },
        build: () => mockBloc,
        expect: () => [const HomeState()]);

    blocTest('''When GetFeedRecipesEvent is added a state of HomeState
         which have feedRequestState = RequestState.loaded, recipes = [...], is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(feedRequestState: RequestState.loading),
                const HomeState(
                    feedRequestState: RequestState.loaded,
                    feedRecipesList: recipes)
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetFeedRecipesEvent()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(feedRequestState: RequestState.loading),
              const HomeState(
                  feedRequestState: RequestState.loaded,
                  feedRecipesList: recipes)
            ]);
    blocTest('''When GetFeedRecipesEvent is added a state of HomeState
         which have feedRequestState = RequestState.error, feedRecipeList = [],
          feedErrorMessage = 'Error'  is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(feedRequestState: RequestState.loading),
                const HomeState(
                    feedRequestState: RequestState.error,
                    feedErrorMessage: "Error")
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetFeedRecipesEvent()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(feedRequestState: RequestState.loading),
              const HomeState(
                  feedRequestState: RequestState.error,
                  feedErrorMessage: "Error")
            ]);
    blocTest('''When GetFeedRecipesEvent is added a state of HomeState
         which have feedRequestState = RequestState.loaded, recipes = [], feedMaxLimit = true is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(feedRequestState: RequestState.loading),
                const HomeState(
                    feedRequestState: RequestState.loaded,
                    feedRecipesList: [],
                    feedMaxLimit: true)
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetFeedRecipesEvent()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(feedRequestState: RequestState.loading),
              const HomeState(
                  feedRequestState: RequestState.loaded,
                  feedRecipesList: [],
                  feedMaxLimit: true)
            ]);
    blocTest('''When GetSearchedRecipesEvent is added a state of HomeState
         which have searchRequestState = RequestState.loaded, recipes = [...], is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(searchRequestState: RequestState.loading),
                const HomeState(
                    searchRequestState: RequestState.loaded,
                    searchRecipesList: recipes)
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetSearchedRecipesEvent(query: "")),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(searchRequestState: RequestState.loading),
              const HomeState(
                  searchRequestState: RequestState.loaded,
                  searchRecipesList: recipes)
            ]);
    blocTest('''When GetSearchedRecipesEvent is added a state of HomeState
         which have searchRequestState = RequestState.error, searchRecipesList = [],
          feedErrorMessage = 'Error'  is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(searchRequestState: RequestState.loading),
                const HomeState(
                    searchRequestState: RequestState.error,
                    searchRecipesList: [],
                    searchErrorMessage: "Error")
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetSearchedRecipesEvent(query: "")),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(searchRequestState: RequestState.loading),
              const HomeState(
                  searchRequestState: RequestState.error,
                  searchRecipesList: [],
                  searchErrorMessage: "Error")
            ]);
    blocTest('''When GetSearchedRecipesEvent is added a state of HomeState
         which have searchRequestState = RequestState.loaded, recipes = [], searchMaxLimit =true is expected''',
        setUp: () {
          whenListen(
              mockBloc,
              Stream.fromIterable([
                const HomeState(searchRequestState: RequestState.loading),
                const HomeState(
                    searchRequestState: RequestState.loaded,
                    searchRecipesList: [],
                    feedMaxLimit: true)
              ]));
        },
        build: () => mockBloc,
        act: (bloc) => bloc.add(const GetSearchedRecipesEvent(query: "")),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              const HomeState(searchRequestState: RequestState.loading),
              const HomeState(
                  searchRequestState: RequestState.loaded,
                  searchRecipesList: [],
                  feedMaxLimit: true)
            ]);
  });
}
