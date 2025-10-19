import 'package:aunkur_farmer/src/common/constant/api_constant.dart';
import 'package:aunkur_farmer/src/feature/agroService/data/model/agro_request_payload.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';

class AgroServiceRepo {
  // Instance of the API client
  final Api client = Api();

  // Get Agro service request list
  Future<List<ConversationModel>> getConversations({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await client.get(ApiConstant.CONVERSATIONS);
      if (response.statusCode == 200) {
        final List data = response.data['data'] as List;
        return data
            .map<ConversationModel>((e) => ConversationModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load conversations');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Create Agro service request
  Future<bool> createAgroServiceRequest(AgroRequestPayload payload) async {
    try {
      final response = await client.post(
        ApiConstant.CREATE_ADVISORY,
        data: payload.toMap(),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to create agro service request');
      }
    } catch (e) {
      rethrow;
    }
  }
}
