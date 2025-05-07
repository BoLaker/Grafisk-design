import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_card.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:provider/provider.dart';

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    final uiController = context.watch<UIController>();
    final recipes = context.watch<RecipeHandler>().bestMatches;

    if (uiController.showRecipeList) {
      return Expanded(
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeCard(
              recipe: recipe,
              onTap: () => uiController.selectRecipe(recipe),
            );
          },
        ),
      );
    } else {
      return Expanded(child: RecipeDetail(uiController.selectedRecipe!));
    }
  }
}

