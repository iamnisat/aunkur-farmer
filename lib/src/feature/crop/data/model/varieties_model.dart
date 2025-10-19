class VarietiesModel {
  final int id;
  final int cropId;
  final String varietyName;
  final String varietyDuration;
  final String varietyYield;
  final String avgExpectedYield;
  final int productionUnit;
  final String specialCharacter;
  final String timeShowing;
  final String companyName;
  final int companyId;
  final double seedRate;
  final int seedRateUnit;
  final double price;
  final int durationStart;
  final int durationEnd;
  final dynamic production;
  final double yieldUp;
  final double yieldLow;
  final List<Season> seasons;
  final List<VarietiesImage> images;
  final String seedRateUnitName;

  const VarietiesModel({
    this.id = 0,
    this.cropId = 0,
    this.varietyName = '',
    this.varietyDuration = '',
    this.varietyYield = '',
    this.avgExpectedYield = '',
    this.productionUnit = 0,
    this.specialCharacter = '',
    this.timeShowing = '',
    this.companyName = '',
    this.companyId = 0,
    this.seedRate = 0,
    this.seedRateUnit = 0,
    this.price = 0.0,
    this.durationStart = 0,
    this.durationEnd = 0,
    this.production,
    this.yieldUp = 0,
    this.yieldLow = 0,
    this.seasons = const [],
    this.images = const [],
    this.seedRateUnitName = '',
  });

  factory VarietiesModel.fromJson(Map<String, dynamic> json) => VarietiesModel(
    id: json["id"] ?? 0,
    cropId: json["crop_id"] ?? 0,
    varietyName: json["variety_name"] ?? '',
    varietyDuration: json["variety_duration"] ?? '',
    varietyYield: json["variety_yield"] ?? '',
    avgExpectedYield: json["avg_expected_yield"] ?? '',
    productionUnit: json["production_unit"] ?? 0,
    specialCharacter: json["special_character"] ?? '',
    timeShowing: json["time_showing"] ?? '',
    companyName: json["company_name"] ?? '',
    companyId: json["company_id"] ?? 0,
    seedRate: json["seed_rate"]?.toDouble() ?? 0.0,
    seedRateUnit: json["seed_rate_unit"] ?? 0,
    price: (json["price"] is int)
        ? (json["price"] as int).toDouble()
        : (json["price"] ?? 0.0).toDouble(),
    durationStart: json["duration_start"] ?? 0,
    durationEnd: json["duration_end"] ?? 0,
    production: json["production"],
    yieldUp: json["yield_up"]?.toDouble() ?? 0.0,
    yieldLow: json["yield_low"]?.toDouble() ?? 0.0,
    seedRateUnitName: json["seed_rate_unit_name"] ?? '',
    seasons: (json["seasons"] == null)
        ? const []
        : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    images: (json["images"] == null)
        ? const []
        : List<VarietiesImage>.from(
            json["images"].map((x) => VarietiesImage.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "crop_id": cropId,
    "variety_name": varietyName,
    "variety_duration": varietyDuration,
    "variety_yield": varietyYield,
    "avg_expected_yield": avgExpectedYield,
    "production_unit": productionUnit,
    "special_character": specialCharacter,
    "time_showing": timeShowing,
    "company_name": companyName,
    "company_id": companyId,
    "seed_rate": seedRate,
    "seed_rate_unit": seedRateUnit,
    "price": price,
    "duration_start": durationStart,
    "duration_end": durationEnd,
    "production": production,
    "yield_up": yieldUp,
    "yield_low": yieldLow,
    "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class VarietiesImage {
  final String images;

  const VarietiesImage({this.images = ''});

  factory VarietiesImage.fromJson(Map<String, dynamic> json) =>
      VarietiesImage(images: json["images"] ?? '');

  Map<String, dynamic> toJson() => {"images": images};
}

class Season {
  final int seasonId;

  const Season({this.seasonId = 0});

  factory Season.fromJson(Map<String, dynamic> json) =>
      Season(seasonId: json["season_id"] ?? 0);

  Map<String, dynamic> toJson() => {"season_id": seasonId};
}
