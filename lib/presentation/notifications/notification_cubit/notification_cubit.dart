import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/data/repository/notifications_repo/notifications_repository.dart';

part 'notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit(this.notificationsRepository)
      : super(NotificationStatesInitial());
  NotificationsRepository notificationsRepository;

  //get notifications_repo
  late NotificationsModel notifications;

  Future<void> getNotificationsData() async {
    emit(NotificationsLoading());
    try {
      notifications = await notificationsRepository.getNotificationsData();
      emit(NotificationsSuccess());
    } catch (error, s) {
      log(
        'get notifications data error',
        error: error,
        stackTrace: s,
      );
      emit(NotificationsError(error.toString()));
    }
  }
}
