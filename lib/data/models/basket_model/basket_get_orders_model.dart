class BasketGetOrdersModel {
  final bool status;
  final Data data;

  BasketGetOrdersModel({
    required this.status,
    required this.data,
  });

  factory BasketGetOrdersModel.fromJson(Map<String, dynamic> json) {
    return BasketGetOrdersModel(
      status: json['status'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class Data {
  final List<Cart> cartItems;
  dynamic subTotal;
  final int total;

  Data({required this.cartItems, this.subTotal, required this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      subTotal: json['subTotal'],
      total: (json['total'] as num).toInt(),
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((element) => Cart.fromJson(element as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Cart {
  final int id;
  int quantity;
  final Product product;

  Cart({required this.id, required this.quantity, required this.product});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class Product {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  late bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      inFavorites: json['in_favorites'] as bool,
      inCart: json['in_cart'] as bool,
    );
  }
}
