

class SearchResult {
  final String name;
  final String imageUrl;
   final int calories;
  final int totalTime;
SearchResult({  this.name, this.imageUrl,this.calories, this.totalTime,  

  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final recipe = json['recipe'];

    return SearchResult(
      name: recipe['label'],
      imageUrl: recipe['image'],
        calories: recipe['calories'].toInt(),
      totalTime: recipe['totalTime'].toInt(),
       
    );
  }
}
