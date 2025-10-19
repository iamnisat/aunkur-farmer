
/* =========================
   Models & helpers
   ========================= */

import 'package:aunkur_farmer/src/common/constant/enum.dart';

class ChatItem {
  final ChatItemType type;
  final String? id;
  final String? text;
  final bool isMe;
  final DateTime? time;
  final MessageStatus? status;

  ChatItem._({
    required this.type,
    this.id,
    this.text,
    this.isMe = false,
    this.time,
    this.status,
  });

  factory ChatItem.msg({
    required String id,
    required String text,
    required bool isMe,
    required DateTime time,
    required MessageStatus status,
  }) => ChatItem._(
    type: ChatItemType.message,
    id: id,
    text: text,
    isMe: isMe,
    time: time,
    status: status,
  );

  factory ChatItem.date(DateTime date) =>
      ChatItem._(type: ChatItemType.date, time: date);

  ChatItem copyWith({
    String? id,
    String? text,
    bool? isMe,
    DateTime? time,
    MessageStatus? status,
  }) {
    return ChatItem._(
      type: type,
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }
}

/* =========================
   AppBar (clean + modern)
   ========================= */
