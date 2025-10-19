class AgroRequestPayload {
  final int year;
  final int cropId;
  final double landAmount;
  final int farmerId;
  final int seasonId;
  final String requestType;
  final String message;

  AgroRequestPayload({
    required this.year,
    required this.cropId,
    required this.landAmount,
    required this.farmerId,
    required this.seasonId,
    required this.requestType,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'crop': cropId,
      'land': landAmount,
      'farmer_id': farmerId,
      'season': seasonId,
      'type': requestType,
      'message': message,
    };
  }
}
