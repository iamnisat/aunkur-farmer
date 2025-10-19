import 'dart:io';

import 'package:aunkur_farmer/src/common/constant/api_constant.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_details_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/herbicide_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_details_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/varieties_model.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:aunkur_farmer/src/service/localStorage/locator_helper.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';

class CropRepo {
  CropRepo();
  // Instance of the API client
  final Api client = Api();

  // Shared preferences or secure storage can be added here for token management
  final preference = locatorHelper<SharedPreferencesHelper>();

  // Crop List
  Future<List<CropModel>> getCrops({required int page, required int size}) async {
    try {
      final response = await client.get(
        ApiConstant.CROPS,
        queryParameters: {'page': page, 'size': size},
      );
      if (response.statusCode == HttpStatus.ok) {
        List<CropModel> crops = response.data['data']
            .map<CropModel>((json) => CropModel.fromJson(json))
            .toList();
        return crops;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch crops');
    } catch (e) {
      throw Exception('Error fetching crops: $e');
    }
  }

  // Crop Details by crop ID
  Future<CropDetailsModel> getCropDetails(int id) async {
    try {
      final response = await client.get('${ApiConstant.CROP_DETAILS}$id');
      if (response.statusCode == HttpStatus.ok) {
        return CropDetailsModel.fromJson(response.data['data']);
      }
      throw Exception(
        response.data['message'] ?? 'Failed to fetch crop details',
      );
    } catch (e) {
      throw Exception('Error fetching crop details: $e');
    }
  }

  // Pesticide List by crop ID
  Future<List<PesticideModel>> getPesticides(int cropId) async {
    try {
      final response = await client.get(
        "${ApiConstant.CROPS}/$cropId/${ApiConstant.PESTICIDE}",
        queryParameters: {'page': 1, 'size': 100},
      );
      if (response.statusCode == HttpStatus.ok) {
        List<PesticideModel> pesticides = response.data['data']
            .map<PesticideModel>((json) => PesticideModel.fromJson(json))
            .toList();
        return pesticides;
      }
    } catch (e) {
      throw Exception('Error fetching pesticides: $e');
    }
    return [];
  }

  // Get Herbicide List by crop ID
  Future<List<HerbicideModel>> getHerbicides(int cropId) async {
    try {
      final response = await client.get(
        "${ApiConstant.CROPS}/$cropId/${ApiConstant.HERBICIDE}",
        queryParameters: {'page': 1, 'size': 100},
      );
      if (response.statusCode == HttpStatus.ok) {
        List<HerbicideModel> herbicides = response.data['data']
            .map<HerbicideModel>((json) => HerbicideModel.fromJson(json))
            .toList();
        return herbicides;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch herbicides');
    } catch (e) {
      throw Exception('Error fetching herbicides: $e');
    }
  }

  // Get Varieties List by crop ID
  Future<List<VarietiesModel>> getVarieties(int cropId) async {
    try {
      final response = await client.get(
        "${ApiConstant.CROPS}/$cropId/${ApiConstant.VARIETIES}",
        queryParameters: {'page': 1, 'size': 100},
      );
      if (response.statusCode == HttpStatus.ok) {
        List<VarietiesModel> varieties = response.data['data']
            .map<VarietiesModel>((json) => VarietiesModel.fromJson(json))
            .toList();
        return varieties;
      }
      throw Exception(response.data['message'] ?? 'Failed to fetch varieties');
    } catch (e) {
      throw Exception('Error fetching varieties: $e');
    }
  }

  // Get Pesticide Details by pesticide ID
  Future<PesticideDetailsModel> getPesticideDetails(
    int pesticideId,
    int cropId,
  ) async {
    try {
      final response = await client.get(
        "${ApiConstant.CROPS}/$cropId/${ApiConstant.PESTICIDE}/$pesticideId",
      );
      if (response.statusCode == HttpStatus.ok) {
        return PesticideDetailsModel.fromJson(response.data['data']);
      }
      throw Exception(
        response.data['message'] ?? 'Failed to fetch pesticide details',
      );
    } catch (e) {
      throw Exception('Error fetching pesticide details: $e');
    }
  }
}
