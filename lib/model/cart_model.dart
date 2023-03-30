class Cart {
  int cost;
  final String food;
  final String imageUrl;
  final String rating;

  Cart({this.rating, this.cost, this.food, this.imageUrl});

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'food': food,
        'imageUrl': imageUrl,
        'rating': rating,
      };

  factory Cart.getModelFromJson(Map<String, dynamic> data) {
    return Cart(
        cost: data["cost"],
        rating: data["rating"],
        food: data["food"],
        imageUrl: data["imageUrl"]);
  }
}
