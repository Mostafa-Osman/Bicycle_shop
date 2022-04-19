class EstimateModel {
  final bool status;
  final EstimateData data;

  EstimateModel({
    required this.status,
    required this.data,
  });

  factory EstimateModel.fromJson(Map<String, dynamic> json) {
    return EstimateModel(
      status: json['status'] as bool,
      data: EstimateData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class EstimateData {
  final int subTotal;
  final int discount;
  final int points;
  final dynamic total;

  EstimateData({
    required this.subTotal,
    required this.discount,
    required this.points,
    required this.total,
  });

  factory EstimateData.fromJson(Map<String, dynamic> json) {
    return EstimateData(
      subTotal: json['sub_total']as int,
      discount: json['discount']as int,
      points: json['points']as int,
      total: json['total'],
    );
  }
}
