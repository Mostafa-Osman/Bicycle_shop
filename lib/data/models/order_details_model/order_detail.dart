class OrderDetailsResponse {
  final bool status;
  final OrderDetailsModel orderDetails;

  OrderDetailsResponse({
    required this.status,
    required this.orderDetails,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailsResponse(
      status: json['status'] as bool,
      orderDetails:
          OrderDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class OrderDetailsModel {
  final int id;
  final dynamic cost;
  final dynamic discount;
  final dynamic points;
  final dynamic vat;
  final dynamic total;
  final String paymentMethod;
  final String date;
  final String status;
  final Address address;
  final List<Products> products;

  OrderDetailsModel({
    required this.id,
    required this.cost,
    required this.discount,
    required this.points,
    required this.vat,
    required this.total,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.address,
    required this.products,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'] as int,
      cost: json['cost'],
      discount: json['discount'],
      points: json['points'],
      vat: json['vat'],
      total: json['total'],
      paymentMethod: json['payment_method'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
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
