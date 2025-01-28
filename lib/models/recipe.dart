class Recipe {
  final String name;
  final String description;
  final String imageUrl;
  final String id;

  const Recipe({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.id,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['name'],
        description: json['description'],
        imageUrl: json['image'],
        id: json['id']);
  }
}
