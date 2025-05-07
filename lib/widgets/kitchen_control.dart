import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:provider/provider.dart';

class kitchenControl extends StatelessWidget {
  const kitchenControl({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = Cuisine.labels;
    final selected = recipeHandler.selectedKitchen ?? labels[0];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Justerar hela raden till höger
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texten justeras till vänster men hela raden går till höger
          Text('Kök:',
            style: AppTheme.smallHeading,
            textAlign: TextAlign.start, // Texten är vänsterjusterad
          ),
          const SizedBox(width: 8), // Litet mellanrum mellan text och dropdown
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
                onChanged: (selected) {
                  if (selected != null) {
                    recipeHandler.setCuisine(selected);
                  }
                },
                items: List.generate(
                  labels.length,
                  (index) {
                    final label = labels[index];
                    final icon = Cuisine.flags[index];
                    return DropdownMenuItem(
                      value: label,
                      child: Row(
                        children: [
                          if (icon != null) ...[
                            icon,
                            const SizedBox(width: 6),
                          ],
                          Text(label),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
