class EstimateModel {
  bool? status;
  String? message;
  Data? data;

  EstimateModel({this.status, this.message, this.data});

  EstimateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  dynamic subTotal;
  dynamic discount;
  dynamic points;
  dynamic total;

  Data({this.subTotal, this.discount, this.points, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    discount = json['discount'];
    points = json['points'];
    total = json['total'];
  }
}
