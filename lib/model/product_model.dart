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

  factory Cart.getModelFromJson({Map<String, dynamic> json}) {
    return Cart(
        cost: json["cost:"], food: json["food:"], imageUrl: json["imageUrl:"]);
  }

  static Cart fromJson(Map<String, dynamic> json) => Cart(
      cost: json["cost:"], food: json["food:"], imageUrl: json["imageUrl:"]);
}
