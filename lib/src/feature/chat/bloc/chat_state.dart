part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatFailure extends ChatState {
  final String error;

  const ChatFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class ChatConversationLoaded extends ChatState {
  final List<ConversationModel> conversations;
  final bool hasReachedMax;

  const ChatConversationLoaded({
    this.conversations = const <ConversationModel>[],
    this.hasReachedMax = false,
  });

  ChatConversationLoaded copyWith({
    List<ConversationModel>? conversations,
    bool? hasReachedMax,
  }) {
    return ChatConversationLoaded(
      conversations: conversations ?? this.conversations,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [conversations, hasReachedMax];
}

final class ChatMessageLoaded extends ChatState {
  final List<ChatItem> messages;
  final bool hasReachedMax;

  const ChatMessageLoaded({
    this.messages = const <ChatItem>[],
    this.hasReachedMax = false,
  });

  ChatMessageLoaded copyWith({List<ChatItem>? messages, bool? hasReachedMax}) {
    return ChatMessageLoaded(
      messages: messages ?? this.messages,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [messages, hasReachedMax];
}

final class ChatMessageSending extends ChatState {}

final class ChatMessageSent extends ChatState {}

final class ChatMessageFailed extends ChatState {
  final String error;

  const ChatMessageFailed(this.error);

  @override
  List<Object> get props => [error];
}
