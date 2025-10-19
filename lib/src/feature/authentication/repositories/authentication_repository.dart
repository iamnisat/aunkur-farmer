import 'dart:io';

import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/api_constant.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/user_model.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:aunkur_farmer/src/utils/jwt_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Firebase Messaging FCM toke
  String? fcmToken;

  // Getter and setter for fcmToken
  String? get getFcmToken => fcmToken;
  set setFcmToken(String? token) => fcmToken = token;

  AuthenticationRepository();

  // Instance of the API client
  final Api client = Api();

  // Shared preferences or secure storage can be added here for token management

  // Method to log in a user
  Future<UserSignUpRequest> login(String email, String password) async {
    try {
     await initFirebaseMessaging();
      final response = await client.post(
        ApiConstant.LOGIN,
        data: {'mobile': email, 'password': password, 'fcm_token': fcmToken},
      );
      // Handle the response as needed
      if (response.statusCode == HttpStatus.ok) {
        final UserSignUpRequest user = UserSignUpRequest.fromJson(
          response.data['data'],
        );
        // Save user data to shared preferences or secure storage
        preference.saveData(AppConstant.TOKEN, user.token);
        JwtHelper.decodeStoredToken();

        return user;
      }
      throw Exception(response.data['message'] ?? 'Login failed');
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

  // Forgot Password method
  Future<bool> forgotPassword(String phone) async {
    try {
      final response = await client.post(
        ApiConstant.FORGOT_PASSWORD,
        data: {'mobile': phone},
      );

      debugPrint("===The response is: $response");
      // Handle the response as needed
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
      throw Exception(response.data['message'] ?? 'Failed to send OTP');
    } catch (e) {
      rethrow;
    }
  }

  // Change Password method
  Future<bool> changePassword(
    String oldPassword,
    String newPassword,
    String mobile,
  ) async {
    try {
      debugPrint("Old Password: $oldPassword");
      debugPrint("New Password: $newPassword");
      debugPrint("Mobile: $mobile");
      final response = await client.post(
        ApiConstant.CHANGE_PASSWORD,
        data: {
          'mobile': mobile,
          'password': oldPassword,
          'newPassword': newPassword,
        },
      );
      // Handle the response as needed
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
      throw Exception(response.data['message'] ?? 'Failed to change password');
    } catch (e) {
      rethrow;
    }
  }

  // Logout method
  Future<void> logout() async {
    preference.removeData();
    // Login Page navigation can be handled in the UI layer
    Navigator.of(
      navigatorKey.currentContext!,
    ).pushNamedAndRemoveUntil('/LoginPage', (route) => false);
  }

  // Method to register a new user

  Future<bool> registerUser(UserSignUpRequest user) async {
    try {
      final response = await client.post(
        ApiConstant.REGISTER,
        data: user.toJson(),
      );
      // Handle the response as needed
      if (response.statusCode == HttpStatus.created) {
        // final UserModel user = UserModel.fromJson(response.data);
        // // Save user data to shared preferences or secure storage
        // preference.saveData(AppConstant.user, user.toJson());
        // preference.saveData(AppConstant.TOKEN, user.token);
        // preference.saveData(AppConstant.USER_ID, user.id);

        return true;
      }
      throw Exception(response.data['message'] ?? 'Registration failed');
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // DIVISIONS API

  Future<List<CommonModel>> getDivisions() async {
    try {
      final response = await client.get(ApiConstant.DIVISIONS);
      if (response.statusCode == HttpStatus.ok) {
        List<CommonModel> divisions = response.data['data']
            .map<CommonModel>((json) => CommonModel.fromJson(json))
            .toList();
        return divisions;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch divisions');
    } catch (e) {
      throw Exception('Error fetching divisions: $e');
    }
  }

  // DISTRICTS API
  Future<List<CommonModel>> getDistricts(int divisionId) async {
    try {
      final response = await client.get('${ApiConstant.DIVISIONS}/$divisionId');
      if (response.statusCode == HttpStatus.ok) {
        List<CommonModel> districts = response.data['data']
            .map<CommonModel>((json) => CommonModel.fromJson(json))
            .toList();
        return districts;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch districts');
    } catch (e) {
      throw Exception('Error fetching districts: $e');
    }
  }

  // UPAZILAS API
  Future<List<CommonModel>> getUpazilas(int districtId) async {
    try {
      final response = await client.get('${ApiConstant.DISTRICTS}/$districtId');
      if (response.statusCode == HttpStatus.ok) {
        List<CommonModel> upazilas = response.data['data']
            .map<CommonModel>((json) => CommonModel.fromJson(json))
            .toList();
        return upazilas;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch upazilas');
    } catch (e) {
      throw Exception('Error fetching upazilas: $e');
    }
  }

  // UNIONS API
  Future<List<CommonModel>> getUnions(int upazilaId) async {
    try {
      final response = await client.get('${ApiConstant.UPAZILAS}/$upazilaId');
      if (response.statusCode == HttpStatus.ok) {
        List<CommonModel> unions = response.data['data']
            .map<CommonModel>((json) => CommonModel.fromJson(json))
            .toList();
        return unions;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch unions');
    } catch (e) {
      throw Exception('Error fetching unions: $e');
    }
  }

  // Featch user profile by user id
  Future<UserModel> getUserProfileInfo() async {
    try {
      final response = await client.get(ApiConstant.PROFILE);
      if (response.statusCode == HttpStatus.ok) {
        final UserModel user = UserModel.fromJson(response.data['data']);
        return user;
      }
      throw Exception(
        response.data['message'] ?? 'Failed to fetch user profile',
      );
    } catch (e) {
      throw Exception('Error fetching user profile: $e');
    }
  }

  Future<void> initFirebaseMessaging() async {
    try {
      debugPrint("======Init Firebase Messaging======");
      String? token = await messaging.getToken();
      debugPrint("FCM Token: $token");

      if (token != null) {
        setFcmToken = token;
      }

      // Listen to the onTokenRefresh event
      messaging.onTokenRefresh.listen((String? newToken) {
        debugPrint("FCM Token Refreshed: $newToken");
        if (newToken != null) {
          setFcmToken = newToken;
        }
      });
    } catch (e) {
      debugPrint("Error getting FCM token: $e");

      return;
    }
  }
}
