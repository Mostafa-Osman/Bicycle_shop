import 'dart:developer';

import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/basket_model/add_to_basket_model.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_get_orders_model.dart';
import 'package:udemy_flutter/data/models/basket_model/update_basket_model.dart';

class BasketRepository {
  final UserPrefs userPrefs;
  const BasketRepository(this.userPrefs);
  // add To Basket Orders
  Future<AddToBasketModel> addToBasketOrders(int productId) async {
    final response = await DioHelper.postData(
      url: basketUrl,
      data: {'product_id': productId},
      token: userPrefs.getUserToken(),
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddToBasketModel.fromJson(data);
    }
    throw data['message'] as String;
  }

  // get My Basket Data
  Future<BasketGetOrdersModel> getMyBasketData() async {
    final response = await DioHelper.getData(url: basketUrl, token: userPrefs.getUserToken());
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketGetOrdersModel.fromJson(data);
    }
    throw data['message'] as String;
  }

  Future<UpdateBasketModel> updateBasketOrderData({
    required int productId,
    required int quantity,
  }) async {
    final response = await DioHelper.putData(
      url: '$updateQuantityOrdersUrl$productId',
      token: userPrefs.getUserToken(),
      data: {
        'quantity': quantity,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      log(data.toString());
      return UpdateBasketModel.fromJson(data);
    }
    throw data['message'] as String;
  }

  Future<AddToBasketModel> deleteOrderFromBasketData({required int productId}) async {
    final response = await DioHelper.deleteData(
      url: '$deleteOrdersUrl$productId',
      token: userPrefs.getUserToken(),
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddToBasketModel.fromJson(data);
    }
    throw data['message'] as String;
  }
}
