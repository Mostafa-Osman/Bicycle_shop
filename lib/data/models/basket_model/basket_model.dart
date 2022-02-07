class BasketModel {
  bool status=false;
  String? message;
  Data? data;

  BasketModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<Cart> cartItems = [];
  dynamic subTotal;
  dynamic total;

  Data.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    total = json['total'];
    if (json['cart_items'] != null) {
      json['cart_items'].forEach((v) {
        cartItems.add(Cart.fromJson(v));
      });
    }
  }
}

class Cart {
  int? id;
  int? quantity;
  Product? product;

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['inFavorites'];
    inCart = json['inCart'];
  }
}
