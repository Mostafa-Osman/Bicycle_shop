class OrderDetailsModel {
  final bool status;
  final OrderDetailsData orderDetails;

  OrderDetailsModel({
    required this.status,
    required this.orderDetails,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      status: json['status'] as bool,
      orderDetails:
          OrderDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class OrderDetailsData {
  final int id;
  final dynamic cost;
  final dynamic discount;
  final dynamic points;
  final dynamic vat;
  final dynamic total;
  final String paymentMethod;
  final String date;
  late final String orderStatus;
  final Address address;
  final List<Products> products;

  OrderDetailsData({
    required this.id,
    required this.cost,
    required this.discount,
    required this.points,
    required this.vat,
    required this.total,
    required this.paymentMethod,
    required this.date,
    required this.orderStatus,
    required this.address,
    required this.products,
  });

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) {
    return OrderDetailsData(
      id: json['id'] as int,
      cost: json['cost'],
      discount: json['discount'],
      points: json['points'],
      vat: json['vat'],
      total: json['total'],
      paymentMethod: json['payment_method'] as String,
      date: json['date'] as String,
      orderStatus: json['status'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map(
            (element) => Products.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Address {
  final int id;
  final String name;
  final String city;
  final String region;
  final String details;

  Address({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int,
      name: json['name'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      details: json['details'] as String,
    );
  }
}

class Products {
  final int id;
  final int quantity;
  final dynamic price;
  final String name;
  final String image;

  Products({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      price: json['price'],
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
