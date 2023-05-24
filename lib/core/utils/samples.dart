import 'package:okoul_recipe_challenge/features/home/domain/entities/rating.dart';
import 'package:okoul_recipe_challenge/features/home/domain/entities/recipe_card.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/component.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/detailed_recipe.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/section.dart';

//samples used for unit tests
const jsonListOfRecipeCards = '''
  [
    {
      "id": 1,
      "name": "Tofu",
      "thumbnail_url": "Http:test/testFromJson.png",
      "user_ratings": {"count_positive": 2, "count_negative": 1, "score": null}
    },
    {
      "id": 2,
      "name": "Apple Pie",
      "thumbnail_url": "Http:test/testFromJson.png",
      "user_ratings": {"count_positive": 3, "count_negative": 9, "score": 0.4}
    },
    {
      "id": 3,
      "name": "Beans on the toast",
      "thumbnail_url": "Http:test/testFromJson.png",
      "user_ratings": null
    }
  ]
''';

const detailedRecipeJson = '''
    {
      "name": "Apple Pie",
      "id": 123,
      "thumbnail_url": "http://applePie.png",
      "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 0.3},
      "instructions": [
        {"display_text": "Cut the veggies", "position": 0},
        {"display_text": "Cut the veggies", "position": 1}
      ],
      "sections": [
        {
          "components": [
            {"raw_text": "Fresh Chickpeas", "position": 0},
            {"raw_text": "Fresh Chickpeas", "position": 1}
          ]
        }
      ]
    }
    ''';

const ratingMapObject = {
  "count_positive": 8,
  "count_negative": 4,
  "score": 0.5
};

const ratingWithoutNullMapObject = {
  "count_positive": 8,
  "count_negative": 4,
  "score": null
};

const recipeCardMapObject = {
  "id": 768,
  "name": "Apple Pie",
  "thumbnail_url": "Http:test/testFromJson.png",
  "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 1}
};

const listOfRecipeCardMapObject = [
  {
    "id": 768,
    "name": "Apple Pie",
    "thumbnail_url": "Http:test/testFromJson.png",
    "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 1}
  },
  {
    "id": 500,
    "name": "Egg scrambles",
    "thumbnail_url": "Http:test/testFromJson.png",
    "user_ratings": {"count_positive": 1, "count_negative": 0, "score": null}
  }
];

const detailedRecipeMapObject = {
  "name": "Apple Pie",
  "id": 123,
  "thumbnail_url": "http://applePie.png",
  "user_ratings": {"count_positive": 8, "count_negative": 4, "score": 0.3},
  "instructions": [
    {'display_text': 'Cut the veggies', 'position': 0},
    {'display_text': 'Cut the veggies', 'position': 1}
  ],
  "sections": [
    {
      "components": [
        {"raw_text": "Fresh Chickpeas", "position": 0},
        {"raw_text": "Fresh Chickpeas", "position": 1}
      ]
    }
  ]
};

const instructionMapObject = {'display_text': 'Cut the veggies', 'position': 0};

const sectionMapObject = {"components": []};

const recipeCard = RecipeCard(
    name: "name",
    id: 1,
    imageURL: "imageURL",
    rating: Rating(countPositive: 0, countNegative: 0, score: 1));

const rating = Rating(countPositive: 5, countNegative: 9, score: 0.8);
const recipes = [recipeCard, recipeCard, recipeCard];

const detailedRecipe = DetailedRecipe(
    name: "name",
    id: 1,
    imageURL: "imageURL",
    rating: Rating(countPositive: 0, countNegative: 0, score: 1),
    instructions: [
      Instruction(instructionDescription: "instructionDescription", step: 0),
      Instruction(instructionDescription: "instructionDescription", step: 1),
    ],
    sections: [
      Sections(components: [
        Component(ingredientDescription: "ingredientDescription", step: 0),
        Component(ingredientDescription: "ingredientDescription", step: 1),
      ])
    ]);

const detailedRecipes = [detailedRecipe, detailedRecipe, detailedRecipe];

const componentMapObject = {"raw_text": "Fresh Chickpeas", "position": 0};
