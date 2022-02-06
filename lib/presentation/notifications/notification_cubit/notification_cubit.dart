import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(NotificationStatesInitialState());

  static NotificationCubit get(context) => BlocProvider.of(context);

  //get notifications
  NotificationsModel? notifications;

  void getNotifications() {
    emit(NotificationsLoadingState());
    DioHelper.getData(url: NOTIFICATIONS, token: token).then((value) {
      notifications = NotificationsModel.fromJson(value.data);
      emit(NotificationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NotificationsErrorState());
    });
  }

}