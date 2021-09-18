class User {
  int userId;
  String name;
  String email;
  String address;
  String gender;
  String avatarUrl;
  List<String> wishList;

  User(
    this.userId,
    this.name,
    this.email,
    this.address,
    this.gender,
    this.avatarUrl,
    this.wishList,
  );

  static fromMap(map) {
    List<String> wishList = [];
    if (map["wishList"] != null) {
      for (var wish in map["wishList"]) {
        wishList.add(wish);
      }
    }

    return User(
      map["userId"],
      map["name"],
      map["email"],
      map["address"],
      map["gender"],
      map["avatarUrl"],
      wishList
    );
  }
}