class PesticideDetailsModel {
  final String resultCode;
  final String status;
  final int id;
  final int cropId;
  final String controlMeasure;
  final String damageControl;
  final String diseaseType;
  final List<PesticideImages> image;
  final int infestationId;
  final int fertilizerSugId;
  final dynamic infestation;
  final dynamic fertilizerSuggestion;
  final List<Chemical> chemical;
  final int priority;
  final String diseaseName;

  const PesticideDetailsModel({
    this.resultCode = '',
    this.status = '',
    this.id = 0,
    this.cropId = 0,
    this.controlMeasure = '',
    this.damageControl = '',
    this.diseaseType = '',
    this.image = const [],
    this.infestationId = 0,
    this.fertilizerSugId = 0,
    this.infestation,
    this.fertilizerSuggestion,
    this.chemical = const [],
    this.priority = 0,
    this.diseaseName = '',
  });

  factory PesticideDetailsModel.fromJson(Map<String, dynamic> json) =>
      PesticideDetailsModel(
        resultCode: json["result_code"] ?? '',
        status: json["status"] ?? '',
        id: json["id"] ?? 0,
        cropId: json["crop_id"] ?? 0,
        controlMeasure: json["control_measure"] ?? '',
        damageControl: json["damage_control"] ?? '',
        diseaseType: json["disease_type"] ?? '',
        image: (json["image"] != null)
            ? List<PesticideImages>.from(
                json["image"].map((x) => PesticideImages.fromJson(x)),
              )
            : const [],
        infestationId: json["infestation_id"] ?? 0,
        fertilizerSugId: json["fertilizer_sug_id"] ?? 0,
        infestation: json["infestation"],
        fertilizerSuggestion: json["fertilizerSuggestion"],
        chemical: (json["chemical"] != null)
            ? List<Chemical>.from(
                json["chemical"].map((x) => Chemical.fromJson(x)),
              )
            : const [],
        priority: json["priority"] ?? 0,
        diseaseName: json["disease_name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "result_code": resultCode,
    "status": status,
    "id": id,
    "crop_id": cropId,
    "control_measure": controlMeasure,
    "damage_control": damageControl,
    "disease_type": diseaseType,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "infestation_id": infestationId,
    "fertilizer_sug_id": fertilizerSugId,
    "infestation": infestation,
    "fertilizerSuggestion": fertilizerSuggestion,
    "chemical": List<dynamic>.from(chemical.map((x) => x.toJson())),
    "priority": priority,
    "disease_name": diseaseName,
  };
}

class Chemical {
  final int id;
  final int pesticideId;
  final dynamic infestationId;
  final int priority;
  final int priceUnit;
  final int price;
  final String pesticideName;
  final String tradeName;
  final String genericName;
  final Company company;
  final String image;
  final double applicationDose;
  final String applicationDoseUnit;
  final double pesticideAmount;
  final String pesticideAmountUnit;
  final int rating;
  final String applicationGuide;
  final List<PacketSizeAndPrice> packetSizeAndPrice;
  final String createdAt;
  final String updatedAt;
  final String applicationDoseUnitName;

  const Chemical({
    this.id = 0,
    this.pesticideId = 0,
    this.infestationId,
    this.priority = 0,
    this.priceUnit = 0,
    this.price = 0,
    this.pesticideName = '',
    this.tradeName = '',
    this.genericName = '',
    this.company = const Company(),
    this.image = '',
    this.applicationDose = 0.0,
    this.applicationDoseUnit = '',
    this.pesticideAmount = 0.0,
    this.pesticideAmountUnit = '',
    this.rating = 0,
    this.applicationGuide = '',
    this.packetSizeAndPrice = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.applicationDoseUnitName = '',
  });

  factory Chemical.fromJson(Map<String, dynamic> json) => Chemical(
    id: json["id"] ?? 0,
    pesticideId: json["pesticide_id"] ?? 0,
    infestationId: json["infestation_id"],
    priority: json["priority"] ?? 0,
    priceUnit: json["price_unit"] ?? 0,
    price: json["price"] ?? 0,
    pesticideName: json["pesticide_name"] ?? '',
    tradeName: json["trade_name"] ?? '',
    genericName: json["generic_name"] ?? '',
    company: json["company"] != null
        ? Company.fromJson(json["company"])
        : const Company(),
    image: json["image"] ?? '',
    applicationDose: (json["application_dose"] ?? 0).toDouble(),
    applicationDoseUnit: json["application_dose_unit"] ?? '',
    pesticideAmount: (json["pesticide_amount"] ?? 0).toDouble(),
    pesticideAmountUnit: json["pesticide_amount_unit"] ?? '',
    rating: json["rating"] ?? 0,
    applicationGuide: json["application_guide"] ?? '',
    applicationDoseUnitName: json["application_dose_unit_name"] ?? '',
    packetSizeAndPrice: (json["packetSizeAndPrice"] != null)
        ? List<PacketSizeAndPrice>.from(
            json["packetSizeAndPrice"].map(
              (x) => PacketSizeAndPrice.fromJson(x),
            ),
          )
        : const [],
    createdAt: json["createdAt"] ?? '',
    updatedAt: json["updatedAt"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pesticide_id": pesticideId,
    "infestation_id": infestationId,
    "priority": priority,
    "price_unit": priceUnit,
    "price": price,
    "pesticide_name": pesticideName,
    "trade_name": tradeName,
    "generic_name": genericName,
    "company": company.toJson(),
    "image": image,
    "application_dose": applicationDose,
    "application_dose_unit": applicationDoseUnit,
    "pesticide_amount": pesticideAmount,
    "pesticide_amount_unit": pesticideAmountUnit,
    "rating": rating,
    "application_guide": applicationGuide,
    "packetSizeAndPrice": List<dynamic>.from(
      packetSizeAndPrice.map((x) => x.toJson()),
    ),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Company {
  final int id;
  final String name;

  const Company({this.id = 0, this.name = ''});

  factory Company.fromJson(Map<String, dynamic> json) =>
      Company(id: json["id"] ?? 0, name: json["name"] ?? '');

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class PacketSizeAndPrice {
  final int size;
  final int price;

  const PacketSizeAndPrice({this.size = 0, this.price = 0});

  factory PacketSizeAndPrice.fromJson(Map<String, dynamic> json) =>
      PacketSizeAndPrice(size: json["size"] ?? 0, price: json["price"] ?? 0);

  Map<String, dynamic> toJson() => {"size": size, "price": price};
}

class PesticideImages {
  final String image;

  const PesticideImages({this.image = ''});

  factory PesticideImages.fromJson(Map<String, dynamic> json) =>
      PesticideImages(image: json["image"] ?? '');

  Map<String, dynamic> toJson() => {"image": image};
}
