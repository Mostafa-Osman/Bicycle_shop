import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/notifications/model/notifications_model.dart';
import 'package:udemy_flutter/screens/notifications/notification_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

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