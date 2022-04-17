class AddOrderModel {
  final bool status;
  final Data data;

  AddOrderModel({required this.status, required this.data});

  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      status: json['status'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final String paymentMethod;
  final dynamic cost;
  final dynamic vat;
  final dynamic discount;
  final dynamic points;
  final dynamic total;
  final int id;

  Data({
    required this.paymentMethod,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.points,
    required this.total,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      paymentMethod: json['payment_method'] as String,
      cost: json['cost'],
      vat: json['vat'],
      discount: json['discount'],
      points: json['points'],
      total: json['total'],
      id: json['id'] as int,
    );
  }
}
