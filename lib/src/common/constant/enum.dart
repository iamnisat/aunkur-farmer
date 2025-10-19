import 'package:aunkur_farmer/generated/l10n.dart';

enum ChatItemType { message, date }

enum MessageStatus { sending, sent, delivered, read, failed }

// Advisory type
enum AdvisoryType { SOIL_TEST, WEATHER, ADVISORY }

// Extension method to get string value of AdvisoryType
extension AdvisoryTypeExtension on AdvisoryType {
  static AdvisoryType fromString(String value) {
    return AdvisoryType.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => AdvisoryType.ADVISORY,
    );
  }

  String get name {
    switch (this) {
      case AdvisoryType.SOIL_TEST:
        return "soil_test";
      case AdvisoryType.WEATHER:
        return "weather";
      case AdvisoryType.ADVISORY:
        return "advisory";
    }
  }

  // Display name for UI
  String get displayName {
    switch (this) {
      case AdvisoryType.SOIL_TEST:
        return S.current.soilTesting;
      case AdvisoryType.WEATHER:
        return S.current.weatherAdvisory;
      case AdvisoryType.ADVISORY:
        return S.current.advisory;
    }
  }
}
