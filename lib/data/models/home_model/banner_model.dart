class BannerModel {
 final bool status;
 final String message;
 final List<Data> data;

  const BannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      status: json['status'] as bool,
      message: json['message']as String ? ??'',
      data: (json["data"] as List<dynamic>)
          .map(
            (element) => Data.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Data {
 final int id;
 final String image;

 const Data({required this.id, required this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      image: json['image'] as String,
    );
  }
}
