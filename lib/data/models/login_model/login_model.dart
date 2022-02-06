class ShopLoginModel {
  bool status = false;
  String message = "";
  UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
  }
}

class UserData {
  int? id;
  dynamic points;
  dynamic credit;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
