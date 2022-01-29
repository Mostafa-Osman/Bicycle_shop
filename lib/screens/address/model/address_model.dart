class AddressModel {
  bool? status;
  String? message;
  Data? data;

  AddressModel({this.status, this.message, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<Data1>? data;

  Data({this.currentPage, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
      });
    }
  }
}

class Data1 {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;

  Data1({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
  }
}
