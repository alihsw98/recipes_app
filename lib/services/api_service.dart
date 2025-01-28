import 'dart:convert';

import 'package:recipes_app/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_app/models/recipe_details.dart';

class ApiService {
  final String baseUrl = "http://localhost:3000/";

  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(Uri.parse(baseUrl + "recipes"));
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      List<Recipe> recipes = [];
      for (int i = 0; i < jsonList.length; i++) {
        recipes.add(Recipe.fromJson(jsonList[i]));
      }
      return recipes;
    } else {
      throw Exception("failed to load recipes");
    }
  }

  Future<RecipeDetails> getRecipeDetails(String recipeid) async {
    final response = await http.get(Uri.parse(baseUrl + 'recipes/$recipeid'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return RecipeDetails.fromJson(data);
    } else {
      throw Exception("Failed to load recipe details");
    }
  }
}
