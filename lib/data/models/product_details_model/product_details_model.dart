class ProductDetailsModel {
  final bool status;
  final String message;
  final Data data;

  ProductDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      status: json['status'] as bool,
      message: json['message'] as String? ?? '',
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<dynamic> images;
  final bool isFavorite;
  late bool inCart;

  Data({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.inCart,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images: (json["images"] as List<dynamic>)
          .map(
            (element) => element as String,
          )
          .toList(),
      isFavorite: json['in_favorites'] as bool,
      inCart: json['in_cart'] as bool,
    );
  }
}
