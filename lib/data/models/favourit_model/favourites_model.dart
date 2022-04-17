class FavouritesModel {
  final bool status;
  final List<FavouritesData> data;

  FavouritesModel({
    required this.status,
    required this.data,
  });

  factory FavouritesModel.fromJson(Map<String, dynamic> json) {
    return FavouritesModel(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map(
            (element) =>
                FavouritesData.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class FavouritesData {
  final int id;
  final Product product;

  FavouritesData({required this.id, required this.product});

  factory FavouritesData.fromJson(Map<String, dynamic> json) {
    return FavouritesData(
      id: json['id'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class Product {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
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
      discount: json['discount'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
