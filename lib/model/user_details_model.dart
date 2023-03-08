class UserDetailsModel {
  final String name;
  // String id;

  UserDetailsModel({
    this.name,
    //  this.id,
  });

  Map<String, dynamic> toJson() => {'name': name};

  factory UserDetailsModel.getModelFromJson({Map<String, dynamic> json}) {
    return UserDetailsModel(
      name: json['name'],
      //  id: json['id'],
    );
  }

  static UserDetailsModel fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        name: json['name'],
      );
}
