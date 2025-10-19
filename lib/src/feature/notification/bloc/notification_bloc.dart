
import 'package:aunkur_farmer/src/feature/notification/data/notification_model.dart';
import 'package:aunkur_farmer/src/feature/notification/repositories/notification_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepo repo;
  NotificationBloc(this.repo) : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      try {
        if (event is NotificationLoadEvent) {
          final data = await repo.getNotifications();
          if (data.isEmpty) {
            emit(NotificationEmpty());
          } else {
            emit(NotificationLoaded(data));
          }
        }
      } catch (e) {
        emit(NotificationError("Error loading notifications${e.toString()}"));
      }
    });
  }
}
