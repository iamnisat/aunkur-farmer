import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/widget/helper.dart';
import 'package:aunkur_farmer/src/feature/notification/bloc/notification_bloc.dart';
import 'package:aunkur_farmer/src/feature/notification/presentation/widget/notification_card.dart';
import 'package:aunkur_farmer/src/feature/notification/repositories/notification_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).notification)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          // AppHelper.of(context).emptyView(),
          RepositoryProvider(
            create: (context) => NotificationRepo.instance,
            child: BlocProvider(
              create: (context) =>
                  NotificationBloc(context.read<NotificationRepo>())
                    ..add(NotificationLoadEvent()),
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationEmpty) {
                    return AppHelper.emptyView();
                  } else if (state is NotificationLoaded) {
                    final groupedNotifications = NotificationRepo.instance
                        .groupNotificationsAsListOfMaps(state.notifications);
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: groupedNotifications.length,
                        itemBuilder: (context, index) {
                          return NotificationCard(
                            date: groupedNotifications[index].keys.first,
                            model: groupedNotifications[index].values.first,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
