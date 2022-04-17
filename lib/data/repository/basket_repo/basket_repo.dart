import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class BasketRepository {
  // add To Basket Orders
  Future<BasketModel> addToBasketOrders(int productId) async {
    final response = await DioHelper.postData(
      url: basketUrl,
      data: {'product_id': productId},
      token: token,
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketModel.fromJson(data);
    }
    throw 'server error';
  }

  // get My Basket Data
  Future<BasketModel> getMyBasketData() async {
    final response = await DioHelper.getData(url: basketUrl, token: token);
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<BasketModel> updateBasketOrderData(int productId, int quantity) async {
    final response = await DioHelper.putData(
      url: '$updateQuantityOrdersUrl$productId',
      token: token,
      data: {
        'quantity': quantity,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<BasketModel> deleteOrderFromBasketData(int productId) async {
    final response = await DioHelper.deleteData(
      url: '$deleteOrdersUrl$productId',
      token: token,
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketModel.fromJson(data);
    }
    throw 'server error';
  }
}
