import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/chat_item_model.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:aunkur_farmer/src/feature/chat/repositories/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo chatRepo;

  ChatBloc(this.chatRepo) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is ChatConversationEvent) {
        try {
          emit(ChatLoading());

          final conversations = await chatRepo.getConversations(
            page: event.page,
            limit: event.limit,
          );
          emit(ChatConversationLoaded(conversations: conversations));
        } catch (e) {
          emit(ChatFailure(e.toString()));
        }
      } else if (event is ChatMessageEvent) {
        try {
          emit(ChatLoading());

          final messages = await chatRepo.getMessages(
            conversationId: event.conversationId,
            page: event.page,
            limit: event.limit,
          );
          emit(ChatMessageLoaded(messages: messages));
        } catch (e) {
          emit(ChatFailure(e.toString()));
        }
      } else if (event is SendMessageEvent) {
        updateSendingStatus(true);
        // Optimistic UI update: add "sending" message immediately
        final currentState = state;
        if (currentState is ChatMessageLoaded) {
          final tempId = DateTime.now().toIso8601String();
          final sendingMsg = ChatItem.msg(
            id: tempId,
            text: event.message,
            isMe: true,
            time: DateTime.now(),
            status: MessageStatus.sending,
          );

          // Show sending message instantly
          final updatedMessages = List<ChatItem>.from(currentState.messages)
            ..add(sendingMsg);
          emit(currentState.copyWith(messages: updatedMessages));

          try {
            // Call API
            await chatRepo.sendMessage(
              conversationId: event.conversationId,
              message: event.message,
            );

            // After successful send → update message status to SENT
            final refreshed = updatedMessages.map((msg) {
              if (msg.id == tempId) {
                return msg.copyWith(status: MessageStatus.delivered);
              }
              return msg;
            }).toList();

            emit(currentState.copyWith(messages: refreshed));
            updateSendingStatus(false);
          } catch (e) {
            // On failure → mark as failed (optional)
            final failed = updatedMessages.map((msg) {
              if (msg.id == tempId) {
                return msg.copyWith(
                  status: MessageStatus.failed,
                ); // or custom fail enum
              }
              return msg;
            }).toList();

            emit(currentState.copyWith(messages: failed));
            updateSendingStatus(false);
            rethrow;
          }
        }
      } else if (event is NewIncomingMessageEvent) {
        debugPrint("=== Incoming message event in ChatBloc ===");
        _handleIncomingMessage(event, emit);
      }
    });
  }

  // Future<void> _handleSendMessage(
  //   SendMessageEvent event,
  //   Emitter<ChatState> emit,
  // ) async {
  //   updateSendingStatus(true);

  //   final currentState = state;
  //   if (currentState is ChatMessageLoaded) {
  //     final tempId = DateTime.now().toIso8601String();
  //     final sendingMsg = ChatItem.msg(
  //       id: tempId,
  //       text: event.message,
  //       isMe: true,
  //       time: DateTime.now(),
  //       status: MessageStatus.sending,
  //     );

  //     final updatedMessages = List<ChatItem>.from(currentState.messages)
  //       ..add(sendingMsg);
  //     emit(currentState.copyWith(messages: updatedMessages));

  //     try {
  //       await chatRepo.sendMessage(
  //         conversationId: event.conversationId,
  //         message: event.message,
  //       );

  //       // Update to "sent"
  //       final refreshed = updatedMessages.map((msg) {
  //         if (msg.id == tempId) {
  //           return msg.copyWith(status: MessageStatus.delivered);
  //         }
  //         return msg;
  //       }).toList();

  //       emit(currentState.copyWith(messages: refreshed));
  //       updateSendingStatus(false);
  //     } catch (e) {
  //       // Mark as failed
  //       final failed = updatedMessages.map((msg) {
  //         if (msg.id == tempId) {
  //           return msg.copyWith(status: MessageStatus.failed);
  //         }
  //         return msg;
  //       }).toList();

  //       emit(currentState.copyWith(messages: failed));
  //       updateSendingStatus(false);
  //       rethrow;
  //     }
  //   }
  // }

  void _handleIncomingMessage(
    NewIncomingMessageEvent event,
    Emitter<ChatState> emit,
  ) {
    final currentState = state;
    if (currentState is ChatMessageLoaded) {
      final incomingMsg = ChatItem.msg(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: event.message,
        isMe: false,
        time: event.time,
        status: MessageStatus.delivered,
      );

      final updatedMessages = List<ChatItem>.from(currentState.messages)
        ..add(incomingMsg);
      emit(currentState.copyWith(messages: updatedMessages));
    }
  }

  // _sendingMessageController
  final _sendingMessageController = BehaviorSubject<bool>();
  Stream<bool> get sendingMessageStream => _sendingMessageController.stream;
  void updateSendingStatus(bool isSending) {
    _sendingMessageController.sink.add(isSending);
  }
}
