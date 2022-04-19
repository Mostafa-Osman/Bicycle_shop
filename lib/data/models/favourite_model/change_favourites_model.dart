class ChangeFavoritesModel {
  final bool status;
  final String message;
  final Data data;

  ChangeFavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int id;
  final Product product;

  Data({
    required this.id,
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class Product {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      price: json['price'] as int,
      oldPrice: json['old_price'] as int,
      discount: json['discount'] as int,
      image: json['image'] as String,
    );
  }
}
