class Cart {
  int cost;
  final String food;
  final String imageUrl;

  Cart({this.cost, this.food, this.imageUrl});

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'food': food,
        'imageUrl': imageUrl,
      };

  factory Cart.getModelFromJson(Map<String, dynamic> data) {
    return Cart(
        cost: data["cost"],
        food: data["food"],
        imageUrl: data["imageUrl"]);
  }
}
