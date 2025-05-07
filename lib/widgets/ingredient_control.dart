import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Consumer<RecipeHandler>(
        builder: (context, recipeHandler, _) {
          final selected = recipeHandler.selectedMainIngredient ?? MainIngredient.labels[0];
          return Row(
            mainAxisAlignment: MainAxisAlignment.end, // Justerar hela raden till höger
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Ingrediens:', 
                style: AppTheme.smallHeading,
                textAlign: TextAlign.start, // Texten är vänsterjusterad
              ),
              const SizedBox(width: 8), // Litet avstånd mellan text och dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(maxWidth: 180),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selected,
                    isExpanded: false,
                    onChanged: (value) => recipeHandler.setMainIngredient(value!),
                    items: List.generate(
                      MainIngredient.labels.length,
                      (i) => DropdownMenuItem(
                        value: MainIngredient.labels[i],
                        child: Row(
                          children: [
                            if (MainIngredient.icons[i] != null) ...[
                              MainIngredient.icons[i]!,
                              const SizedBox(width: 6),
                            ],
                            Text(MainIngredient.labels[i]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}








