
class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<DetailsData> detailsData = [];

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      detailsData.add(DetailsData.fromJson(element));
    });
  }
}

class DetailsData {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;
  bool? inFavorites;
  bool? inCart;



  DetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
