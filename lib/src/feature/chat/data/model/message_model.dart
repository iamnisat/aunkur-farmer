class MessageModel {
  final int id;
  final String message;
  final int createdAt;
  final User? user;
  final Farmer? farmer;

  MessageModel({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.user,
    required this.farmer,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    message: json["message"],
    createdAt: json["createdAt"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
    farmer: json["farmer"] != null ? Farmer.fromJson(json["farmer"]) : null,
  );
}

class Farmer {
  final int id;
  final String name;
  final dynamic baseImage;

  Farmer({required this.id, required this.name, required this.baseImage});

  factory Farmer.fromJson(Map<String, dynamic> json) =>
      Farmer(id: json["id"], name: json["name"], baseImage: json["base_image"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "base_image": baseImage,
  };
}

class User {
  final int id;
  final String name;
  final dynamic baseImage;

  User({required this.id, required this.name, required this.baseImage});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], name: json["name"], baseImage: json["base_image"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "base_image": baseImage,
  };
}
