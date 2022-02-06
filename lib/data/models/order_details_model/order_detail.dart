class OrderDetailsResponse {
  bool? status;
  String? message;
  OrderDetailsModel? orderDetails;

  OrderDetailsResponse({this.status, this.message, this.orderDetails});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    orderDetails = new OrderDetailsModel.fromJson(json['data']);
  }
}

class OrderDetailsModel {
  int? id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  String? paymentMethod;
  String? date;
  String? status;
  Address? address;
  List<Products>? products;

  OrderDetailsModel(
      {this.id,
      this.cost,
      this.discount,
      this.points,
      this.vat,
      this.total,
      this.paymentMethod,
      this.date,
      this.status,
      this.address,
      this.products});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
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

  Address({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
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
