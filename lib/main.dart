import 'package:flutter/material.dart';
import 'package:recipes_app/pages/recipes_page.dart';

void main() {
  runApp(RecipesApp());
}

class RecipesApp extends StatefulWidget {
  const RecipesApp({super.key});

  @override
  State<RecipesApp> createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipesPage(),
    );
  }
}
