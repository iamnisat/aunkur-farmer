import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/page/chat_room_page.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/widget/conversation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationListPage extends StatelessWidget {
  const ConversationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversations')),
      body: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ChatLoading) {
              return loadingPageWidget();
            } else if (state is ChatFailure) {
              return errorPageWidget(
                title: S.current.errorOccurred,
                description: state.error,
                onRetry: () =>
                    context.read<ChatBloc>().add(const ChatConversationEvent()),
              );
            } else if (state is ChatConversationLoaded) {
              final conversations = state.conversations;
              if (conversations.isEmpty) {
                return emptyScreenWidget(
                  title: S.current.empty,
                  description: "Conversation list is empty",
                  onAction: () {
                    context.read<ChatBloc>().add(const ChatConversationEvent());
                  },
                );
              }
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context
                      .read<ChatBloc>()
                      .add(const ChatConversationEvent());
                },
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ConversationCard(
                      model: conversations[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/ChatRoomPage',
                          arguments: conversations[index].id,
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 10.heightBox;
                  },
                  itemCount: conversations.length,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
