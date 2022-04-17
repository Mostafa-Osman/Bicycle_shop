class MyOrderModel {
  final bool status;
  final Data data;

  MyOrderModel({
    required this.status,
    required this.data,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      status: json['status'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final List<OrderData> listDoneOrders;

  final int total;

  Data({required this.listDoneOrders, required this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      listDoneOrders: (json['data'] as List<dynamic>)
          .map((element) => OrderData.fromJson(element as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );
  }
}

class OrderData {
  final int id;
  final dynamic total;
  final String date;
  final String status;

  OrderData({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'] as int,
      total: json['total'],
      date: json['date'] as String,
      status: json['status'] as String,
    );
  }
}
