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
      data: ((json["data"] as Map<String, dynamic>)['data'] as List<dynamic>)
          .map(
            (element) =>
                FavouritesData.fromJson(element as Map<String, dynamic>),
      )
          .toList(),

    );
  }
}

class FavouritesData {
  final DataDetails product;

  FavouritesData({ required this.product});

  factory FavouritesData.fromJson(Map<String, dynamic> json) {
    return FavouritesData(
      product: DataDetails.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class DataDetails {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  DataDetails({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) {
    return DataDetails(
      id: json['id'] as int,
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'] ,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
