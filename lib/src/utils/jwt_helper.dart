import 'dart:convert';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:flutter/foundation.dart';

class JwtHelper {
  /// Decode the saved JWT token from SharedPreferences
  static Map<String, dynamic>? decodeStoredToken() {
    try {
      final token = preference.getString(AppConstant.TOKEN);
      if (token.isEmpty) {
        debugPrint("⚠️ No token found in SharedPreferences");
        return null;
      }
      debugPrint("=== Decoding token: $token");

      final parts = token.split('.');
      if (parts.length != 3) {
        throw const FormatException('Invalid JWT token format');
      }

      final payload = _decodeBase64(parts[1]);
      final payloadMap = json.decode(payload);

      if (payloadMap is! Map<String, dynamic>) {
        throw const FormatException('Invalid payload structure');
      }

      // Store User id , name, mobile
      preference.saveData(AppConstant.USER_ID, payloadMap['id']);
      preference.saveData(AppConstant.PHONE, payloadMap['mobile']);
      preference.saveData(AppConstant.USER_NAME, payloadMap['name']);

      return payloadMap;
    } catch (e) {
      debugPrint("❌ Error decoding stored token: $e");
      return null;
    }
  }

  /// Get user ID from stored token
  static int? getUserId() {
    final payload = decodeStoredToken();
    return payload?['id'];
  }

  /// Get user name from stored token
  static String? getUserName() {
    final payload = decodeStoredToken();
    return payload?['name'];
  }

  /// Get mobile number from stored token
  static String? getUserMobile() {
    final payload = decodeStoredToken();
    return payload?['mobile'];
  }

  /// Get roles from stored token
  static List<String>? getUserRoles() {
    final payload = decodeStoredToken();
    final roles = payload?['role'];
    if (roles is List) {
      return roles.map((r) => r.toString()).toList();
    }
    return null;
  }

  /// Get expiry date from stored token
  static DateTime? getExpiryDate() {
    final payload = decodeStoredToken();
    if (payload == null || !payload.containsKey('exp')) return null;
    final exp = payload['exp'];
    return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
  }

  /// Check if stored token is expired
  static bool isTokenExpired() {
    final expiry = getExpiryDate();
    if (expiry == null) return true;
    return DateTime.now().isAfter(expiry);
  }

  /// Decode Base64Url safely
  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw const FormatException('Illegal base64url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }
}
