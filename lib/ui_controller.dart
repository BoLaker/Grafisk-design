import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';

class UIController extends ChangeNotifier {
  final RecipeHandler recipeHandler;

  UIController({required this.recipeHandler});

  bool _showRecipeList = true;
  Recipe? _selectedRecipe;

  bool get showRecipeList => _showRecipeList;
  Recipe? get selectedRecipe => _selectedRecipe;

  List<Recipe> get recipeList => recipeHandler.bestMatches;

  void selectRecipe(Recipe recipe) {
    _showRecipeList = false;
    _selectedRecipe = recipe;
    notifyListeners();
  }

  void deselectRecipe() {
    _showRecipeList = true;
    notifyListeners();
  }
}
