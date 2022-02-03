class PromoCodeModel {
  bool? status;
  String? message;
  Data? data;

  PromoCodeModel({this.status, this.message, this.data});

  PromoCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? code;
  int? value;

  Data({
    this.id,
    this.code,
    this.value,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
  }
}
