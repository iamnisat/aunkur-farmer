import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/widget/chat_app_bar.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/widget/composer_bar.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/widget/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* ============================================================
   Chat Room (modern, clean, real-time from API)
   ============================================================ */

class ChatRoomPage extends StatefulWidget {
  final int conversationId;
  const ChatRoomPage({super.key, required this.conversationId});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _controller = TextEditingController();
  final _scrollCtrl = ScrollController();
  final _focusNode = FocusNode();
  bool _showTyping = false;

  @override
  void initState() {
    super.initState();

    // Fetch messages for this conversation
    context.read<ChatBloc>().add(
      ChatMessageEvent(conversationId: widget.conversationId),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    // Send to bloc
    context.read<ChatBloc>().add(
      SendMessageEvent(conversationId: widget.conversationId, message: text),
    );

    _controller.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: ChatAppBar(title: 'Aunkur Support', subtitle: 'Online'),
      body: SafeArea(
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatMessageLoaded) {
              _scrollToBottom();
            }
          },

          builder: (context, state) {
            if (state is ChatLoading) {
              return loadingPageWidget();
            }

            if (state is ChatFailure) {
              return errorPageWidget(
                title: S.current.errorOccurred,
                description: state.error,
                onRetry: () {
                  context.read<ChatBloc>().add(
                    ChatMessageEvent(conversationId: widget.conversationId),
                  );
                },
              );
            }

            if (state is ChatMessageLoaded) {
              final messages = state.messages; // List<ChatItem>

              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _focusNode.unfocus(),
                      child: ListView.builder(
                        controller: _scrollCtrl,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                        itemCount: messages.length + (_showTyping ? 1 : 0),
                        itemBuilder: (context, i) {
                          final dataIndexFromEnd = _showTyping ? (i - 1) : i;
                          final logicalIndex =
                              messages.length - 1 - dataIndexFromEnd;

                          if (logicalIndex < 0 ||
                              logicalIndex >= messages.length) {
                            return const SizedBox.shrink();
                          }

                          final item = messages[logicalIndex];

                          switch (item.type) {
                            case ChatItemType.date:
                              return DateHeader(date: item.time!);

                            case ChatItemType.message:
                              return Align(
                                alignment: item.isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: MessageBubble(
                                  text: item.text!,
                                  time: item.time!,
                                  isMe: item.isMe,
                                  status: item.status!,
                                  onLongPress: () {
                                    Clipboard.setData(
                                      ClipboardData(text: item.text!),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Copied'),
                                        duration: Duration(milliseconds: 900),
                                      ),
                                    );
                                  },
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  ),

                  // Composer (text + send)
                  StreamBuilder<bool>(
                    stream: context.read<ChatBloc>().sendingMessageStream,
                    builder: (context, asyncSnapshot) {
                      debugPrint('isSending: ${asyncSnapshot.data}');
                      return ComposerBar(
                        controller: _controller,
                        focusNode: _focusNode,
                        onSend: _send,
                        isSending: asyncSnapshot.data ?? false,
                      );
                    },
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
