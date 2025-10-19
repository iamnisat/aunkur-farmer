import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> requestPermission() async {
    late final Map<Permission, PermissionStatus> statuses;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      statuses = await [
        Permission.camera,
        Permission.notification,

      ].request();
    } else {
      statuses = await [
        Permission.notification,
        Permission.camera,
      ].request();
    }

    bool ispass = true;
    statuses.forEach((key, value) {
      if (value.isDenied) {
        ispass = false;
      } else if (value.isPermanentlyDenied) {
        debugPrint("Current status: $key is permanently denied");
        ispass = false;
        openAppSettings();
      }
    });
    return ispass;
  }

  static Future<bool> hasLocationPermission() async {
    bool status = false;
    await PermissionHandler().requestPermission().then((isPass) async {
      try {
        status = isPass;
      } catch (e) {
        status = isPass;
      }
    });
    return status;
  }

  static Future<Position?> getCurrentLocation() async {
    Position? currentPosition;

    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        debugPrint("Current location: $value");
        currentPosition = value;
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    return currentPosition;
  }
}