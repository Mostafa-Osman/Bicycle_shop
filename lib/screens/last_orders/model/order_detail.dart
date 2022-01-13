class OrderDetailsModel {
  bool? status;
  String? message;
  Data? data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  int? pointsCommission;
  String? promoCode;
  String? paymentMethod;
  String? date;
  String? status;
  Address? address;
  List<Products>? products;

  Data(
      {this.id,
        this.cost,
        this.discount,
        this.points,
        this.vat,
        this.total,
        this.pointsCommission,
        this.promoCode,
        this.paymentMethod,
        this.date,
        this.status,
        this.address,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    date = json['date'];
    status = json['status'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

}

class Address {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  Address(
      {this.id,
        this.name,
        this.city,
        this.region,
        this.details,
        this.notes,
        this.latitude,
        this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

}

class Products {
  int? id;
  int? quantity;
  dynamic price;
  String? name;
  String? image;

  Products({this.id, this.quantity, this.price, this.name, this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    name = json['name'];
    image = json['image'];
  }

}