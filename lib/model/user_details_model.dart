class UserDetailsModel {
  final String name;
  final String address;
  // String id;

  UserDetailsModel( {
    this.name,
    this.address,
    //  this.id,
  });

  Map<String, dynamic> toJson() => {'name': name};

  factory UserDetailsModel.getModelFromJson({Map<String, dynamic> json}) {
    return UserDetailsModel(
      name: json['name'], 
      address: json['address']
 );
  }
}
