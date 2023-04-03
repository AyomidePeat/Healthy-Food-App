class Favourite {
  int cost;
  final String food;
  final String imageUrl;
  final String calorie;

  Favourite({this.calorie, this.cost, this.food, this.imageUrl});

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'food': food,
        'imageUrl': imageUrl,
        'calorie': calorie,
      };

  factory Favourite.getModelFromJson(Map<String, dynamic> data) {
    return Favourite(
        cost: data["cost"],
        calorie: data["calorie"],
        food: data["food"],
        imageUrl: data["imageUrl"]);
  }
}
