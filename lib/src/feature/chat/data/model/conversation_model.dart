class ConversationModel {
  final int id;
  final String lastMessage;
  final int lastDateTime;
  final String convName;
  final Thread thread;

  ConversationModel({
    required this.id,
    this.lastMessage = "",
    this.lastDateTime = 0,
    this.convName = "",
    Thread? thread,
  }) : thread = thread ?? Thread.empty();

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json["id"] ?? 0,
        lastMessage: json["last_message"]?.toString() ?? "",
        lastDateTime: json["last_date_time"] is int
            ? json["last_date_time"]
            : int.tryParse(json["last_date_time"]?.toString() ?? "0") ?? 0,
        convName: json["conv_name"]?.toString() ?? "",
        thread: json["thread"] != null
            ? Thread.fromJson(json["thread"])
            : Thread.empty(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "last_message": lastMessage,
    "last_date_time": lastDateTime,
    "conv_name": convName,
    "thread": thread.toJson(),
  };
}

class Thread {
  final int id;
  final int land;
  final String crop;
  final int year;
  final String type;
  final int seasonId;

  Thread({
    required this.id,
    this.land = 0,
    this.crop = "",
    this.year = 0,
    this.type = "",
    this.seasonId = 0,
  });

  /// Default empty constructor
  factory Thread.empty() => Thread(id: 0);

  factory Thread.fromJson(Map<String, dynamic> json) => Thread(
    id: json["id"] ?? 0,
    land: json["land"] is int
        ? json["land"]
        : int.tryParse(json["land"]?.toString() ?? "0") ?? 0,
    crop: json["crop"]?.toString() ?? "",
    year: json["year"] is int
        ? json["year"]
        : int.tryParse(json["year"]?.toString() ?? "0") ?? 0,
    type: json["type"]?.toString() ?? "",
    seasonId: json["season"] is int
        ? json["season"]
        : int.tryParse(json["season"]?.toString() ?? "0") ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "land": land,
    "crop": crop,
    "year": year,
    "type": type,
    "season_id": seasonId,
  };
}
