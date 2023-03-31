

class Recipe {
  final String name;
  final String imageUrl;
 
 
  final String mealType;
    final int calories;
  final int totalTime;

 Recipe( {  this.name, this.imageUrl,this.calories, this.mealType, this.totalTime,

  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final recipe = json['recipe'];

    final List<String> healthLabels = List<String>.from(recipe['healthLabels']);
    final List<String> dietLabels = List<String>.from(recipe['dietLabels']);
    final List<String> ingredients = List<String>.from(recipe['ingredientLines']);

    return Recipe(
      name: recipe['label'],
      imageUrl: recipe['image'],
       calories: recipe['calories'].toInt(),
      totalTime: recipe['totalTime'].toInt(),
    );
  }
}
