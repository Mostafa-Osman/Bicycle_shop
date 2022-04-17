class PromoCodeModel {
  bool status;
  Data data;

  PromoCodeModel({required this.status, required this.data});

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      status: json['status'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int id;
  final String code;
  final int value;

  Data({
    required this.id,
    required this.code,
    required this.value,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      code: json['code'] as String,
      value: json['value'] as int,
    );
  }
}
