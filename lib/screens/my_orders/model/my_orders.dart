class MyOrderModel {
  bool? status;
  String? message;
  Data1? data;

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }
}

class Data1 {
  List<Data> allOrders = [];

  Data1.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        allOrders.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  dynamic total;
  String? date;
  String? status;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
  }
}
