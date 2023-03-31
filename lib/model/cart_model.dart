class Cart {
  int cost;
  final String food;
  final String imageUrl;
  final String calorie;

  Cart({this.calorie, this.cost, this.food, this.imageUrl});

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'food': food,
        'imageUrl': imageUrl,
        'calorie': calorie,
      };

  factory Cart.getModelFromJson(Map<String, dynamic> data) {
    return Cart(
        cost: data["cost"],
        calorie: data["calorie"],
        food: data["food"],
        imageUrl: data["imageUrl"]);
  }
}
