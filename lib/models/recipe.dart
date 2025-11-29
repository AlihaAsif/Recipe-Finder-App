class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;
  final String instructions;
  final String image;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.image,
    required this.tags,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: json['instructions'] ?? '',
      image: json['image'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'ingredients': ingredients,
      'instructions': instructions,
      'image': image,
      'tags': tags,
    };
  }

  // Helper method to get category for filtering
  String get category {
    if (tags.contains('breakfast')) return 'breakfast';
    if (tags.contains('lunch')) return 'lunch';
    if (tags.contains('dinner')) return 'dinner';
    if (tags.contains('featured')) return 'featured';
    return 'other';
  }

  // Helper method to get cooking time (estimated based on recipe type)
  int get cookingTime {
    if (tags.contains('quick')) return 10;
    if (tags.contains('breakfast')) return 15;
    if (tags.contains('lunch')) return 25;
    if (tags.contains('dinner')) return 30;
    return 20;
  }

  // Helper to split instructions into steps
  List<String> get steps {
    return instructions.split('. ').where((step) => step.trim().isNotEmpty).toList();
  }
}