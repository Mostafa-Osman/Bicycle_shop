class HomeModel {
  final bool status;
  final String message;
  final Data data;

  HomeModel({required this.status, required this.message, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'] as bool,
      message: json['message'] as String? ??'',
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int currentPage;
  final List<DetailsData> detailsData;

  const Data({required this.currentPage, required this.detailsData});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      currentPage: json['current_page'] as int,
      detailsData: (json["data"] as List<dynamic>)
          .map(
            (element) => DetailsData.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class DetailsData {
 final int id;
 final dynamic price;
 final dynamic oldPrice;
 final dynamic discount;
 final String image;
 final String name;
 final String description;
 final List<dynamic> images;
 final bool isFavorite;
 final bool inCart;

  const DetailsData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.isFavorite,
    required this.inCart,
  });

  factory DetailsData.fromJson(Map<String, dynamic> json) {
    return DetailsData(
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
