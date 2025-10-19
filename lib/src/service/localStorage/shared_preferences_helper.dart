import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesHelper._();

  // Using a singleton pattern
  static Future<SharedPreferencesHelper> getInstance() async {
    _instance ??= SharedPreferencesHelper._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

// Get Int Value from Shared Preferences Helper
  int getInt(String key) {
    try {
      int value = _preferences.getInt(key) ?? 0;
      return value;
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  // Get Double Value from Shared Preferences Helper
  double getDouble(String key) {
    try {
      var value = _preferences.get(key); // Get the raw value
      if (value is int) {
        return value.toDouble(); // Convert int to double
      } else if (value is double) {
        return value; // Return directly if it's already a double
      } else {
        return 0.0; // Default value if key does not exist or invalid type
      }
    } catch (e) {
      debugPrint('Error getting $key: $e');
      throw Exception("Error Occurred $e");
    }
  }

  // Get String Value from Shared Preferences Helper
  String getString(String key) {
    try {
      String value = _preferences.getString(key) ?? "";
      return value;
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  // Get Bool Value from Shared Preferences Helper
  bool getBool(String key) {
    try {
      bool value = _preferences.getBool(key) ?? false;
      return value;
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  // Get List<String> Value from Shared Preferences Helper
  List<String> getStringList(String key) {
    try {
      List<String> value = _preferences.getStringList(key) ?? [];
      return value;
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  bool saveData(String key, dynamic value) {
    try {
      // Easily log the data that we save to shared preferences
      debugPrint('Saving $key: $value');

      // Save data to shared preferences
      if (value is String) {
        _preferences.setString(key, value);
      } else if (value is int) {
        _preferences.setInt(key, value);
      } else if (value is double) {
        _preferences.setDouble(key, value);
      } else if (value is bool) {
        _preferences.setBool(key, value);
      } else if (value is List<String>) {
        _preferences.setStringList(key, value);
      }
      return true;
    } catch (e) {
      debugPrint('Error saving $key: $e');
      return false;
    }
  }

  // remove data from shared preferences by key
  bool removeDataByKey(String key) {
    try {
      _preferences.remove(key);
      return true;
    } catch (e) {
      debugPrint('Error removing $key: $e');
      return false;
    }
  }

  // Remove Data from Shared Preferences Helper
  bool removeData() {
    try {
      _preferences.clear();
      return true;
    } catch (e) {
      debugPrint('Error removing : $e');
      return false;
    }
  }
}