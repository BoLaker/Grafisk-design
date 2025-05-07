import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart'; 

class RecipeImage extends StatelessWidget {
  final Recipe recipe;

  const RecipeImage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    var square = ClipRect(
      child: Container(
        width: 104, 
        height: 104,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image, 
        ),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0); 

    return Stack(
      children: [
        square,
        if (flagImage != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flagImage,
          ),
      ],
    );
  }
}
