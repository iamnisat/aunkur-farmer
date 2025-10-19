class DivisionModel {
  int id;
  String name;

  DivisionModel({required this.id, required this.name});

  factory DivisionModel.fromJson(Map<String, dynamic> json) =>
      DivisionModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
