class AddToBagModel {
  bool? status;
  String? message;
  Data? data;

  AddToBagModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;

  }
}

class Data {
  List<CartItems> cartItems = [];
  int? subTotal;
  dynamic total;

  Data.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    total = json['total'];
    if (json['cart_items'] != null) {
      json['cart_items'].forEach((v) {
        cartItems.add(CartItems.fromJson(v));
      });
    }
  }
}

class CartItems {
  int? id;
  int? quantity;
  Product? product;

  CartItems.fromJson(Map<String, dynamic> json) {
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
