class RecipeDetails {
  final String name;
  final String description;
  final List ingredients;
  final List instractions;
  final int prepTime;
  final Map<String, dynamic> nutrition;
  final String imgeUrl;

  const RecipeDetails({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.instractions,
    required this.prepTime,
    required this.nutrition,
    required this.imgeUrl,
  });

  factory RecipeDetails.fromJson(Map<String, dynamic> json) {
    return RecipeDetails(
      name: json['name'],
      description: json['description'],
      ingredients: json['ingredients'],
      instractions: json['instructions'],
      prepTime: json['prepTime'],
      nutrition: json['nutrition'],
      imgeUrl: json['image'],
    );
  }
}
