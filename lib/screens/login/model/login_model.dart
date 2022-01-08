class ShopLoginModel {
  bool status=false;
  String message="";
  UserData? data;


  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  int? points;
  int? credit;
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

