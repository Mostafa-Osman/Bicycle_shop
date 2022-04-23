class UpdateBasketModel {
  final bool status;
  final String message;
  final UpdateBasketData data;

  UpdateBasketModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateBasketModel.fromJson(Map<String, dynamic> json) {
    return UpdateBasketModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: UpdateBasketData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UpdateBasketData {
  final List<CartItems> cartItems;
  final dynamic subTotal;
  final dynamic total;

  UpdateBasketData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory UpdateBasketData.fromJson(Map<String, dynamic> json) {
    return UpdateBasketData(
      cartItems: List.from(json['cart_items'] as List<CartItems>? ??[])
          .map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: json['sub_total'],
      total: json['total'],
    );
  }
}

class CartItems {
  final int id;
  final int quantity;
  final Product product;

  CartItems({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return CartItems(
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
  final bool inCart;

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
