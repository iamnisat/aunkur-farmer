part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class ChatConversationEvent extends ChatEvent {
  final int page;
  final int limit;

  const ChatConversationEvent({this.page = 1, this.limit = 20});

  @override
  List<Object> get props => [page, limit];
}

final class ChatMessageEvent extends ChatEvent {
  final int conversationId;
  final int page;
  final int limit;

  const ChatMessageEvent({
    required this.conversationId,
    this.page = 1,
    this.limit = 20,
  });

  @override
  List<Object> get props => [conversationId, page, limit];
}

final class SendMessageEvent extends ChatEvent {
  final int conversationId;
  final String message;

  const SendMessageEvent({required this.conversationId, required this.message});

  @override
  List<Object> get props => [conversationId, message];
}

final class NewIncomingMessageEvent extends ChatEvent {
  final int conversationId;
  final String message;
  final DateTime time;
  final int id;

  const NewIncomingMessageEvent({
    required this.conversationId,
    required this.message,
    required this.time,
    required this.id,
  });

  @override
  List<Object> get props => [conversationId, message, time, id];
}