

class Recipe {
  final String name;
  final String imageUrl;
 
    final int calories;
  final int totalTime;

 Recipe( {  this.name, this.imageUrl,this.calories,  this.totalTime,

  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final recipe = json['recipe'];

    return Recipe(
      name: recipe['label'],
      imageUrl: recipe['image'],
       calories: recipe['calories'].toInt(),
      totalTime: recipe['totalTime'].toInt(),
    );
  }
}
