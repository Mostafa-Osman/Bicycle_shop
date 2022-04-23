class CancelOrderModel {
  final bool status;
  final Data data;

  CancelOrderModel({
    required this.status,
    required this.data,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final int id;
  final dynamic cost;
  final int discount;
  final int points;
  final dynamic vat;
  final dynamic total;
  final int pointsCommission;
  final String promoCode;
  final String paymentMethod;

  Data({
    required this.id,
    required this.cost,
    required this.discount,
    required this.points,
    required this.vat,
    required this.total,
    required this.pointsCommission,
    required this.promoCode,
    required this.paymentMethod,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      cost: json['cost'] ,
      discount: json['discount'] as int,
      points: json['points'] as int,
      vat: json['vat'] ,
      total: json['total'] ,
      pointsCommission: json['points_commission'] as int,
      promoCode: json['promo_code'] as String,
      paymentMethod: json['payment_method'] as String,
    );
  }
}
