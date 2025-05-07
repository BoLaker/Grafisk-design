import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/recipe_image.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback? onTap;

  const RecipeCard({super.key, required this.recipe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        hoverColor: Colors.grey.withOpacity(0.1), 
        onTap: onTap,
        child: Container(
          height: 160, 
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              RecipeImage(recipe: recipe),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text('${recipe.time} minuter'),
                        const SizedBox(width: 12),
                        const Text('Pris:'),
                        const SizedBox(width: 4),
                        Text('${recipe.price} kr'),
                        const SizedBox(width: 12),
                        Difficulty.icon(recipe.difficulty, width: 48) ?? const SizedBox(),
                        const SizedBox(width: 12),
                        MainIngredient.icon(recipe.mainIngredient) ?? const SizedBox(),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



