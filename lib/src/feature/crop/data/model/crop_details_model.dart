int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

class CropDetailsModel {
  final int id;
  final int creatorId;
  final String cropName;
  final String cropBanglaName;
  final String scientificName;
  final String image;
  final String cropFamily;
  final String generalInfo;
  final double averageProduction;
  final List<dynamic> cropSettings;
  final List<FirmCropAez> firmCropAez;
  final List<CropInfestationGuideline> cropInfestationGuidelines;
  final CropCategory cropCategory;
  final Irrigation irrigation;
  final Climate climate;
  final Seed seed;
  final Fertilizer fertilizer;
  final Harvest landPreparation;
  final Harvest harvest;
  final Harvest intercultural;

  CropDetailsModel({
    this.id = 0,
    this.creatorId = 0,
    this.cropName = '',
    this.cropBanglaName = '',
    this.scientificName = '',
    this.image = '',
    this.cropFamily = '',
    this.generalInfo = '',
    this.averageProduction = 0,
    this.cropSettings = const [],
    this.firmCropAez = const [],
    this.cropInfestationGuidelines = const [],
    this.cropCategory = const CropCategory(),
    this.irrigation = const Irrigation(),
    this.climate = const Climate(),
    this.seed = const Seed(),
    this.fertilizer = const Fertilizer(),
    this.landPreparation = const Harvest(),
    this.harvest = const Harvest(),
    this.intercultural = const Harvest(),
  });

  factory CropDetailsModel.fromJson(Map<String, dynamic> json) =>
      CropDetailsModel(
        id: _toInt(json["id"]),
        creatorId: _toInt(json["creator_id"]),
        cropName: json["crop_name"] ?? '',
        cropBanglaName: json["crop_bangla_name"] ?? '',
        scientificName: json["scientific_name"] ?? '',
        image: json["image"] ?? '',
        cropFamily: json["crop_family"] ?? '',
        generalInfo: json["general_info"] ?? '',
        averageProduction: _toDouble(json["average_production"]),
        cropSettings: json["cropSettings"] == null
            ? []
            : List<dynamic>.from(json["cropSettings"].map((x) => x)),
        firmCropAez: json["firm_crop_aez"] == null
            ? []
            : List<FirmCropAez>.from(
                json["firm_crop_aez"].map((x) => FirmCropAez.fromJson(x))),
        cropInfestationGuidelines: json["cropInfestationGuidelines"] == null
            ? []
            : List<CropInfestationGuideline>.from(
                json["cropInfestationGuidelines"]
                    .map((x) => CropInfestationGuideline.fromJson(x))),
        cropCategory: json["crop_category"] != null
            ? CropCategory.fromJson(json["crop_category"])
            : const CropCategory(),
        irrigation: json["irrigation"] != null
            ? Irrigation.fromJson(json["irrigation"])
            : const Irrigation(),
        climate: json["climate"] != null
            ? Climate.fromJson(json["climate"])
            : const Climate(),
        seed: json["seed"] != null ? Seed.fromJson(json["seed"]) : const Seed(),
        fertilizer: json["fertilizer"] != null
            ? Fertilizer.fromJson(json["fertilizer"])
            : const Fertilizer(),
        landPreparation: json["landPreparation"] != null
            ? Harvest.fromJson(json["landPreparation"])
            : const Harvest(),
        harvest: json["harvest"] != null
            ? Harvest.fromJson(json["harvest"])
            : const Harvest(),
        intercultural: json["intercultural"] != null
            ? Harvest.fromJson(json["intercultural"])
            : const Harvest(),
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
        "cropSettings": List<dynamic>.from(cropSettings.map((x) => x)),
        "firm_crop_aez": List<dynamic>.from(firmCropAez.map((x) => x.toJson())),
        "cropInfestationGuidelines":
            List<dynamic>.from(cropInfestationGuidelines.map((x) => x.toJson())),
        "crop_category": cropCategory.toJson(),
        "irrigation": irrigation.toJson(),
        "climate": climate.toJson(),
        "seed": seed.toJson(),
        "fertilizer": fertilizer.toJson(),
        "landPreparation": landPreparation.toJson(),
        "harvest": harvest.toJson(),
        "intercultural": intercultural.toJson(),
      };
}

// ========================= SUB MODELS ==============================

class Climate {
  final int cropId;
  final int climatePhEnd;
  final int climatePhStart;
  final int climateEcEnd;
  final int climateEcStart;
  final int climateRainfallStart;
  final int climateRainfallEnd;
  final int climateTemperatureStart;
  final int climateTemperatureEnd;
  final int salinityStart;
  final int salinityEnd;
  final String climateHumidity;
  final String climateHumidityEnd;
  final String generalInfo;
  final dynamic landType;
  final dynamic soilTexture;

  const Climate({
    this.cropId = 0,
    this.climatePhEnd = 0,
    this.climatePhStart = 0,
    this.climateEcEnd = 0,
    this.climateEcStart = 0,
    this.climateRainfallStart = 0,
    this.climateRainfallEnd = 0,
    this.climateTemperatureStart = 0,
    this.climateTemperatureEnd = 0,
    this.salinityStart = 0,
    this.salinityEnd = 0,
    this.climateHumidity = '',
    this.climateHumidityEnd = '',
    this.generalInfo = '',
    this.landType,
    this.soilTexture,
  });

  factory Climate.fromJson(Map<String, dynamic> json) => Climate(
        cropId: _toInt(json["crop_id"]),
        climatePhEnd: _toInt(json["climate_ph_end"]),
        climatePhStart: _toInt(json["climate_ph_start"]),
        climateEcEnd: _toInt(json["climate_ec_end"]),
        climateEcStart: _toInt(json["climate_ec_start"]),
        climateRainfallStart: _toInt(json["climate_rainfall_start"]),
        climateRainfallEnd: _toInt(json["climate_rainfall_end"]),
        climateTemperatureStart: _toInt(json["climate_temperature_start"]),
        climateTemperatureEnd: _toInt(json["climate_temperature_end"]),
        salinityStart: _toInt(json["salinity_start"]),
        salinityEnd: _toInt(json["salinity_end"]),
        climateHumidity: json["climate_humidity"]?.toString() ?? '',
        climateHumidityEnd: json["climate_humidity_end"]?.toString() ?? '',
        generalInfo: json["general_info"] ?? '',
        landType: json["land_type"],
        soilTexture: json["soil_texture"],
      );

  Map<String, dynamic> toJson() => {
        "crop_id": cropId,
        "climate_ph_end": climatePhEnd,
        "climate_ph_start": climatePhStart,
        "climate_ec_end": climateEcEnd,
        "climate_ec_start": climateEcStart,
        "climate_rainfall_start": climateRainfallStart,
        "climate_rainfall_end": climateRainfallEnd,
        "climate_temperature_start": climateTemperatureStart,
        "climate_temperature_end": climateTemperatureEnd,
        "salinity_start": salinityStart,
        "salinity_end": salinityEnd,
        "climate_humidity": climateHumidity,
        "climate_humidity_end": climateHumidityEnd,
        "general_info": generalInfo,
        "land_type": landType,
        "soil_texture": soilTexture,
      };
}

class CropCategory {
  final String categoryName;
  final int id;
  final dynamic categoryCode;

  const CropCategory({this.categoryName = '', this.id = 0, this.categoryCode});

  factory CropCategory.fromJson(Map<String, dynamic> json) => CropCategory(
        categoryName: json["category_name"] ?? '',
        id: _toInt(json["id"]),
        categoryCode: json["category_code"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "id": id,
        "category_code": categoryCode,
      };
}

class CropInfestationGuideline {
  final int id;
  final int cropId;
  final int infestationId;
  final String applicationGuide;

  const CropInfestationGuideline({
    this.id = 0,
    this.cropId = 0,
    this.infestationId = 0,
    this.applicationGuide = '',
  });

  factory CropInfestationGuideline.fromJson(Map<String, dynamic> json) =>
      CropInfestationGuideline(
        id: _toInt(json["id"]),
        cropId: _toInt(json["crop_id"]),
        infestationId: _toInt(json["infestation_id"]),
        applicationGuide: json["application_guide"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "crop_id": cropId,
        "infestation_id": infestationId,
        "application_guide": applicationGuide,
      };
}

class Fertilizer {
  final String fertilizer;

  const Fertilizer({this.fertilizer = ''});

  factory Fertilizer.fromJson(Map<String, dynamic> json) =>
      Fertilizer(fertilizer: json["fertilizer"] ?? '');

  Map<String, dynamic> toJson() => {"fertilizer": fertilizer};
}

class FirmCropAez {
  final int id;
  final int aezId;
  final int cropId;
  final List<CropBasedElement> cropBasedElement;

  const FirmCropAez({
    this.id = 0,
    this.aezId = 0,
    this.cropId = 0,
    this.cropBasedElement = const [],
  });

  factory FirmCropAez.fromJson(Map<String, dynamic> json) => FirmCropAez(
        id: _toInt(json["id"]),
        aezId: _toInt(json["aez_id"]),
        cropId: _toInt(json["crop_id"]),
        cropBasedElement: json["cropBasedElement"] == null
            ? []
            : List<CropBasedElement>.from(
                json["cropBasedElement"].map((x) => CropBasedElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aez_id": aezId,
        "crop_id": cropId,
        "cropBasedElement":
            List<dynamic>.from(cropBasedElement.map((x) => x.toJson())),
      };
}

class CropBasedElement {
  final String elementName;
  final String slop;
  final String intercept;
  final int element;

  const CropBasedElement({
    this.elementName = '',
    this.slop = '',
    this.intercept = '',
    this.element = 0,
  });

  factory CropBasedElement.fromJson(Map<String, dynamic> json) =>
      CropBasedElement(
        elementName: json["element_name"] ?? '',
        slop: json["slop"]?.toString() ?? '',
        intercept: json["intercept"]?.toString() ?? '',
        element: _toInt(json["element"]),
      );

  Map<String, dynamic> toJson() => {
        "element_name": elementName,
        "slop": slop,
        "intercept": intercept,
        "element": element,
      };
}

class Harvest {
  final String description;

  const Harvest({this.description = ''});

  factory Harvest.fromJson(Map<String, dynamic> json) =>
      Harvest(description: json["description"] ?? '');

  Map<String, dynamic> toJson() => {"description": description};
}

class Irrigation {
  final String cropId;
  final String description;

  const Irrigation({this.cropId = '', this.description = ''});

  factory Irrigation.fromJson(Map<String, dynamic> json) => Irrigation(
        cropId: json["crop_id"]?.toString() ?? '',
        description: json["description"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "crop_id": cropId,
        "description": description,
      };
}

class Seed {
  final String cropId;
  final String showingMethod;
  final String seedbed;
  final String seedRate;
  final String treatment;

  const Seed({
    this.cropId = '',
    this.showingMethod = '',
    this.seedbed = '',
    this.seedRate = '',
    this.treatment = '',
  });

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        cropId: json["crop_id"]?.toString() ?? '',
        showingMethod: json["showing_method"] ?? '',
        seedbed: json["seedbed"] ?? '',
        seedRate: json["seed_rate"] ?? '',
        treatment: json["treatment"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "crop_id": cropId,
        "showing_method": showingMethod,
        "seedbed": seedbed,
        "seed_rate": seedRate,
        "treatment": treatment,
      };
}
