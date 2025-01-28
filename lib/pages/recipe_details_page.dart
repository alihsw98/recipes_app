import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe_details.dart';
import 'package:recipes_app/services/api_service.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({required this.recipeId, super.key});
  final String recipeId;

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
      ),
      body: FutureBuilder<RecipeDetails>(
          future: apiService.getRecipeDetails(widget.recipeId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(' Error: ${snapshot.error}'),
                );
              }
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(snapshot.data!.imgeUrl),
                        SizedBox(
                          height: 20,
                        ),
                        Text(snapshot.data!.name),
                        SizedBox(
                          height: 20,
                        ),
                        Text(snapshot.data!.description),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Intgredients:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ...snapshot.data!.ingredients
                            .map((ingredient) => Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(ingredient),
                                  ],
                                ))
                            .toList(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Instractions:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ...snapshot.data!.instractions.map(
                          (instrantion) => Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(instrantion),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Calories: ${snapshot.data!.nutrition['calories']}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('fat: ${snapshot.data!.nutrition['fat']}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Calories: ${snapshot.data!.nutrition['calories']}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Protein: ${snapshot.data!.nutrition['protein']}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Preparation Time: ${snapshot.data!.prepTime}'),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                );

                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SingleChildScrollView(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Image.network(snapshot.data!.imgeUrl),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text(snapshot.data!.name),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text(snapshot.data!.description),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text(
                //           'Intgredient:',
                //           style: TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         ...snapshot.data!.ingredients
                //             .map((ingredients) => Column(
                //                   children: [
                //                     SizedBox(height: 10),
                //                     Text(ingredients),
                //                   ],
                //                 ))
                //             .toList(),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text(
                //           'Instaraction:',
                //           style: TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         ...snapshot.data!.instractions.map(
                //           (instraction) => Column(
                //             children: [
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text(instraction),
                //             ],
                //           ),
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text("Nutritions"),
                //         Text(
                //             'Calories: ${snapshot.data!.nutrition['calories']}'),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text('Fat: ${snapshot.data!.nutrition['fat']}'),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text('Protein: ${snapshot.data!.nutrition['protein']}'),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text('Protein: ${snapshot.data!.nutrition['protein']}'),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text(
                //             "Prepartion Time ${snapshot.data!.prepTime} minutes"),
                //         SizedBox(
                //           height: 40,
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              }
            }
            return SizedBox.shrink();
          }),
    );
  }
}
