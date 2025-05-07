import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetail(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        uiController.deselectRecipe();
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 240.0,
                          height: 240.0,
                          child: recipe.customImage(
                            width: 240.0,
                            height: 240.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          recipe.name,
                          style: AppTheme.largeHeading,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Kök: ${recipe.cuisine}', style: AppTheme.smallHeading),
                      const SizedBox(width: 16),
                      Text('Svårighetsgrad: ${recipe.difficulty}', style: AppTheme.smallHeading),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 16),
                      const SizedBox(width: 4),
                      Text('${recipe.time} min'),
                      const SizedBox(width: 16),
                      const Icon(Icons.euro_symbol, size: 16),
                      const SizedBox(width: 4),
                      Text('${recipe.price} kr'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text('Ingredienser:', style: AppTheme.smallHeading),
                  const SizedBox(height: 8.0),
                  Text(
                    recipe.ingredients.map((i) => i.toString()).join(', '),
                  ),
                  const SizedBox(height: 16.0),
                  Text('Tillagning:', style: AppTheme.smallHeading),
                  const SizedBox(height: 8.0),
                  Text(recipe.instruction),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

