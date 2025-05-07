import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';

import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';

import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

 @override
Widget build(BuildContext context) {
   return Scaffold(
     body: Row(children: [_controlPanel(context), const RecipeArea()]),
   );
}

Widget _controlPanel(BuildContext context, {double width = 320}) {
  return Container(
    width: width,
    color: const Color.fromARGB(255, 193, 210, 218),
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Yttre padding för hela panelen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(), // Loggan
            const SizedBox(height: 16), // Luft efter loggan

            const Text(
              "Hitta ett recept som passar genom att ändra inställningarna nedanför",
              style: AppTheme.smallHeading,
            ),

            const SizedBox(height: 16),
            IngredientControl(),
            const SizedBox(height: 12),
            kitchenControl(),

            const SizedBox(height: 24),
            const Text("Svårighetsgrad", style: AppTheme.smallHeading),
            const SizedBox(height: 8),
            DifficulyControl(),

            const SizedBox(height: 16),
            const Text("Maxpris", style: AppTheme.smallHeading),
            const SizedBox(height: 8),
            PriceControl(),

            const SizedBox(height: 16),
            const Text("Maxtid", style: AppTheme.smallHeading),
            const SizedBox(height: 8),
            TimeControl(),
          ],
        ),
      ),
    ),
  );
}



}
