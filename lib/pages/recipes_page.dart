import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/pages/recipe_details_page.dart';
import 'package:recipes_app/services/api_service.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes Page'),
      ),
      body: FutureBuilder<List<Recipe>>(
          future: apiService.getRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final List<Recipe> recipes = snapshot.data!;
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RecipeDetailsPage(
                                recipeId: recipes[index].id);
                          }));
                        },
                        child: ListTile(
                          title: Text(recipes[index].name),
                          subtitle: Text(recipes[index].description),
                          leading: Image.network(recipes[index].imageUrl),
                        ),
                      );
                    });
              }
            } else {
              return Center(
                child: Text("No Recipes available"),
              );
            }
            return SizedBox.shrink();
          }),
    );
  }
}
