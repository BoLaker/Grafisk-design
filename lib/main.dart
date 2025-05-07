import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeHandler()),
        ChangeNotifierProxyProvider<RecipeHandler, UIController>(
          create: (_) => UIController(recipeHandler: RecipeHandler()),
          update: (_, recipeHandler, __) =>
              UIController(recipeHandler: recipeHandler),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receptsök',
      theme: ThemeData(
        fontFamily: 'Nunito',  // Här används den lokalt installerade fonten direkt
      ),
      home: MainView(),
    );
  }
}


