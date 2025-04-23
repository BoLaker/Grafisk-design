import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';

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

Widget _controlPanel(context, {double width = 320}) {
   return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: SingleChildScrollView(child: Column(children: [Padding(padding:const EdgeInsets.all(16.0), child: Text("Receptsök")), Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Hitta ett recept som passar genom att ändra instälningarna nedanför")), Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Row(children:[Text("ingredients"), SizedBox(width: 16), IngredientControl()])), Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Row(children:[Text("cuisine"), SizedBox(width: 16), kitchenControl()])), Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Row(children:[SizedBox(width: 115), Text("Difficulty")])),Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: DifficulyControl()),Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Maxpris")),Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: PriceControl()), Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Maxtid")),Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: TimeControl())])),
   );
}


}
