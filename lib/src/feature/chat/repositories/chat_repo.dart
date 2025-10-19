import 'dart:io';

import 'package:aunkur_farmer/src/common/constant/api_constant.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/chat_item_model.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/message_model.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:flutter/material.dart';

class ChatRepo {
  final Api client = Api();

  // Get Conversations list
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

  // Get Messages list by conversationId
  Future<List<ChatItem>> getMessages({
    required int conversationId,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await client.get(
        '${ApiConstant.CONVERSATIONS}/$conversationId',
      );
      if (response.statusCode == HttpStatus.ok) {
        final List data = response.data['data'];
        final List<MessageModel> messages = data
            .map<MessageModel>((e) => MessageModel.fromJson(e))
            .toList();
        // Convert to ChatItems
        final chatItems = _buildChatItemsFromMessages(messages: messages);

        return chatItems;
      }
      throw Exception('Failed to load messages');
    } catch (e) {
      rethrow;
    }
  }

  List<ChatItem> _buildChatItemsFromMessages({
    required List<MessageModel> messages,
  }) {
    final List<ChatItem> items = [];

    // Sort oldest → newest
    messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    DateTime? lastDate;

    for (final msg in messages) {
      // Parse message timestamp
      final msgTime = DateTime.fromMillisecondsSinceEpoch(
        msg.createdAt,
        isUtc: false,
      );

      // Check if date header needed
      if (lastDate == null ||
          msgTime.day != lastDate.day ||
          msgTime.month != lastDate.month ||
          msgTime.year != lastDate.year) {
        items.add(ChatItem.date(msgTime));
        lastDate = msgTime;
      }

      // Farmer present = message from me
      final bool isMe = msg.farmer != null;

      // Map API model → UI chat item
      items.add(
        ChatItem.msg(
          id: msg.id.toString(),
          text: msg.message,
          isMe: isMe,
          time: msgTime,
          status: MessageStatus.read, // default (you can adapt later)
        ),
      );
    }

    return items;
  }

  // Send message
  Future<void> sendMessage({
    required int conversationId,
    required String message,
  }) async {
    try {
      final response = await client.post(
        ApiConstant.MESSAGES,
        data: {
          'message': message,
          'thread_module_id': conversationId,
          'farmer_id': preference.getInt(AppConstant.USER_ID),
        },
      );
      if (response.statusCode == HttpStatus.created) {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }
}
