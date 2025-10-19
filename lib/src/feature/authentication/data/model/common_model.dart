class CommonModel {
  final int id;
  final String name;
  final String slug;

  CommonModel({
    required this.id,
    required this.name,
    this.slug = '',
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'] ?? '',
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}

class LanguageModel {
  final int id;
  final String name;
  final String code;
  final String countryFlag;
  final String country;

  LanguageModel({
    required this.id,
    required this.name,
    required this.code,
    required this.countryFlag,
    required this.country,
  });

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'countryFlag': countryFlag,
      'country': country,
    };
  }
}
