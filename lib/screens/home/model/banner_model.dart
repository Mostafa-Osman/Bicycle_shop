class BannerModel {
  bool? status;
 String? message;
  List<Data> data=[];

  BannerModel({this.status, this.message, required this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? image;
  Null category;
  Null product;

  Data({this.id, this.image, this.category, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

}