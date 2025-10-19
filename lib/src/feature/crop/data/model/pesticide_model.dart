class PesticideModel {
  final int id;
  final dynamic cropId;
  final int infestationId;
  final dynamic fertilizerSugId;
  final List<PesticideImage> images;
  final int priority;
  final String diseaseType;
  final String diseaseName;
  final dynamic damageControl;

  PesticideModel({
    required this.id,
    required this.cropId,
    required this.infestationId,
    required this.fertilizerSugId,
    required this.images,
    required this.priority,
    required this.diseaseType,
    required this.diseaseName,
    required this.damageControl,
  });

  factory PesticideModel.fromJson(Map<String, dynamic> json) => PesticideModel(
    id: json["id"],
    cropId: json["crop_id"],
    infestationId: json["infestation_id"],
    fertilizerSugId: json["fertilizer_sug_id"],
    images: List<PesticideImage>.from(json["image"].map((x) => PesticideImage.fromJson(x))),
    priority: json["priority"],
    diseaseType: json["disease_type"],
    diseaseName: json["disease_name"],
    damageControl: json["damage_control"],
  );
}

class PesticideImage {
  final String image;

  PesticideImage({required this.image});

  factory PesticideImage.fromJson(Map<String, dynamic> json) =>
      PesticideImage(image: json["image"]);

  Map<String, dynamic> toJson() => {"image": image};
}
