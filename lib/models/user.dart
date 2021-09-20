class User {
  int userId;
  String name;
  String email;
  String address;
  String gender;
  String avatarUrl;

  User(
    this.userId,
    this.name,
    this.email,
    this.address,
    this.gender,
    this.avatarUrl,
  );

  static fromMap(map) {

    return User(
      map["userId"],
      map["name"],
      map["email"],
      map["address"],
      map["gender"],
      map["avatarUrl"],
    );
  }
}