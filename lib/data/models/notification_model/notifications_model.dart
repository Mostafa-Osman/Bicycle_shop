class NotificationsModel {
  final bool status;
  final String message;
  final List<NotificationData> notificationData;

  const NotificationsModel({
    required this.status,
    required this.message,
    required this.notificationData,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      status: json['status'] as bool,
      message: json['message'] as String? ?? '',
      notificationData:
          ((json["data"] as Map<String, dynamic>)['data'] as List<dynamic>)
              .map(
                (element) =>
                    NotificationData.fromJson(element as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

class NotificationData {
  final int id;
  final String title;
  final String message;

  const NotificationData({
    required this.id,
    required this.title,
    required this.message,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] as int,
      title: json['title'] as String,
      message: json['message'] as String,
    );
  }
}
