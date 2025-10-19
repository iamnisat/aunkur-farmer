class CropModel {
  final int id;
  final int creatorId;
  final String cropName;
  final String cropBanglaName;
  final String scientificName;
  final String image;
  final String cropFamily;
  final String generalInfo;
  final int averageProduction;

  CropModel({
    required this.id,
    required this.creatorId,
    required this.cropName,
    required this.cropBanglaName,
    required this.scientificName,
    required this.image,
    required this.cropFamily,
    required this.generalInfo,
    required this.averageProduction,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) => CropModel(
    id: json["id"],
    creatorId: json["creator_id"],
    cropName: json["crop_name"] ?? "",
    cropBanglaName: json["crop_bangla_name"] ?? "",
    scientificName: json["scientific_name"] ?? "",
    image: json["image"] ?? "",
    cropFamily: json["crop_family"] ?? "",
    generalInfo: json["general_info"] ?? "",
    averageProduction: json["average_production"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "creator_id": creatorId,
    "crop_name": cropName,
    "crop_bangla_name": cropBanglaName,
    "scientific_name": scientificName,
    "image": image,
    "crop_family": cropFamily,
    "general_info": generalInfo,
    "average_production": averageProduction,
  };
}
