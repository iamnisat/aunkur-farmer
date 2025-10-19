class HerbicideModel {
  final int id;
  final int cropId;
  final String pesticideName;
  final String tradeName;
  final String genericName;
  final String companyName;
  final double applicationDose;
  final int applicationDoseUnit;
  final double pesticideAmount;
  final int? pesticideAmountUnit;
  final int rating;
  final double price;
  final int priceUnit;
  final int priority;
  final String? applicationGuide;
  final bool isDeleted;
  final String applicationDoseUnitName;
  HerbicideModel({
    required this.id,
    required this.cropId,
    required this.pesticideName,
    required this.tradeName,
    required this.genericName,
    required this.companyName,
    required this.applicationDose,
    required this.applicationDoseUnit,
    required this.pesticideAmount,
    required this.pesticideAmountUnit,
    required this.rating,
    required this.price,
    required this.priceUnit,
    required this.priority,
    required this.applicationGuide,
    required this.isDeleted,
    this.applicationDoseUnitName = '',
  });

  factory HerbicideModel.fromJson(Map<String, dynamic> json) => HerbicideModel(
    id: json["id"],
    cropId: json["crop_id"],
    pesticideName: json["pesticide_name"] ?? '',
    tradeName: json["trade_name"] ?? '',
    genericName: json["generic_name"] ?? '',
    companyName: json["company_name"] ?? '',
    applicationDose: json["application_dose"]?.toDouble(),
    applicationDoseUnit: json["application_dose_unit"],
    pesticideAmount: json["pesticide_amount"]?.toDouble(),
    pesticideAmountUnit: json["pesticide_amount_unit"],
    rating: json["rating"] ?? 0,
    price: json["price"]?.toDouble(),
    priceUnit: json["price_unit"] ?? 0,
    priority: json["priority"] ?? 0,
    applicationGuide: json["application_guide"] ?? "",
    applicationDoseUnitName: json["application_dose_unit_name"] ?? '',
    isDeleted: json["is_deleted"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "crop_id": cropId,
    "pesticide_name": pesticideName,
    "trade_name": tradeName,
    "generic_name": genericName,
    "company_name": companyName,
    "application_dose": applicationDose,
    "application_dose_unit": applicationDoseUnit,
    "pesticide_amount": pesticideAmount,
    "pesticide_amount_unit": pesticideAmountUnit,
    "rating": rating,
    "price": price,
    "price_unit": priceUnit,
    "priority": priority,
    "application_guide": applicationGuide,
    "is_deleted": isDeleted,
  };
}
