class MyOrderModel {
  bool? status;
  String? message;
  Data? data;

  MyOrderModel({this.status, this.message, this.data});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Data1> listDoneOrders=[];
  int? total;

  Data({required this.listDoneOrders, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listDoneOrders = <Data1>[];
      json['data'].forEach((v) {
        listDoneOrders.add(new Data1.fromJson(v));
      });
    }
    total = json['total'];
  }
}

class Data1 {
  int? id;
  dynamic total;
  String? date;
  String? status;

  Data1({this.id, this.total, this.date, this.status});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
  }
}

