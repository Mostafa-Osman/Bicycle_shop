class NotificationsModel {
  bool? status;
  String? message;
  Data1? data;

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }
}

class Data1 {
  int? currentPage;
  List<Data> notificationData = [];
  String? firstPageUrl;
  // int? from;
  // int? lastPage;
  // String? lastPageUrl;
  // Null nextPageUrl;
  // String? path;
  // int? perPage;
  // Null prevPageUrl;
  // int? to;
  // int? total;

  Data1.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        notificationData.add( Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    // from = json['from'];
    // lastPage = json['last_page'];
    // lastPageUrl = json['last_page_url'];
    // nextPageUrl = json['next_page_url'];
    // path = json['path'];
    // perPage = json['per_page'];
    // prevPageUrl = json['prev_page_url'];
    // to = json['to'];
    // total = json['total'];
  }
}

class Data {
  int? id;
  String? title;
  String? message;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
  }
}


