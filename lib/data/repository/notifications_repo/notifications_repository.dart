import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class NotificationsRepository {
  Future<NotificationsModel> getNotificationsData() async {
    final response =
    await DioHelper.getData(url: notificationsUrl, token: token);
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return NotificationsModel.fromJson(data);
    }
    throw 'server error';
  }


}
