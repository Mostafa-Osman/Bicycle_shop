class ShopLoginModel {
  final bool status;

  final String message;

  final UserData data;

  ShopLoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) {
    return ShopLoginModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UserData {
  final int id;
  final dynamic points;
  final dynamic credit;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  UserData({
    required this.id,
    required this.points,
    required this.credit,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      points: json['points'] as String,
      credit: json['credit'] as String,
      token: json['token'] as String,
    );
  }
}
