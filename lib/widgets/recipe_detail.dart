import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetail(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Column(
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
                width: 200.0,
                height: 200.0,
                child: recipe.customImage(),
              ),
              const SizedBox(height: 16.0),
             
              Text(
                recipe.name,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
