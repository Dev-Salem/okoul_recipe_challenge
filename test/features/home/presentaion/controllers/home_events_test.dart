import 'package:flutter_test/flutter_test.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_controllers.dart';

void main() {
  group('Test HomeEvents -', () {
    test('HomeEvents supports equality', () {
      expect(const HomeEvents(), equals(const HomeEvents()));
    });
    test('HomeEvents props should have no objects', () {
      expect(const HomeEvents().props, []);
    });
    test('GetFeedRecipeEvent supports equality', () {
      expect(const GetFeedRecipesEvent(), equals(const GetFeedRecipesEvent()));
    });
    test('GetSearchedRecipesEvent supports equality', () {
      expect(const GetSearchedRecipesEvent(query: ""),
          equals(const GetSearchedRecipesEvent(query: "")));
    });
    test('GetSearchedRecipesEvent props should have query', () {
      expect(
          const GetSearchedRecipesEvent(query: "").props, equals(<Object>[""]));
    });
  });
}
