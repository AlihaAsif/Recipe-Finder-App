import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/recipe.dart';

class RecipeService {
  static Future<List<Recipe>> loadRecipes() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/recipes.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Recipe>> getRecipesByCategory(String category) async {
    final allRecipes = await loadRecipes();
    return allRecipes.where((recipe) => recipe.category == category).toList();
  }

  static Future<List<Recipe>> searchRecipes(String query, List<Recipe> recipes) async {
    if (query.isEmpty) return recipes;
    return recipes.where((recipe) =>
    recipe.title.toLowerCase().contains(query.toLowerCase()) ||
        recipe.ingredients.any((ingredient) => ingredient.toLowerCase().contains(query.toLowerCase())) ||
        recipe.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }
}