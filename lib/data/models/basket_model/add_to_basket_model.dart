class AddToBasketModel {
  final bool status;
  final String message;
  final Data data;

  AddToBasketModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddToBasketModel.fromJson(Map<String, dynamic> json) {
    return AddToBasketModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int id;
  dynamic quantity;
  final Product product;

  Data({
    required this.quantity,
    required this.product,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      quantity: json['quantity'],
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class Product {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
