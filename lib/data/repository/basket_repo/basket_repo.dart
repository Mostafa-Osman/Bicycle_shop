import 'dart:developer';

import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/basket_model/add_to_basket_model.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_get_orders_model.dart';
import 'package:udemy_flutter/data/models/basket_model/update_basket_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class BasketRepository {
  // add To Basket Orders
  Future<AddToBasketModel> addToBasketOrders(int productId) async {
    final response = await DioHelper.postData(
      url: basketUrl,
      data: {'product_id': productId},
      token: token,
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddToBasketModel.fromJson(data);
    }
    throw 'server error';
  }

  // get My Basket Data
  Future<BasketGetOrdersModel> getMyBasketData() async {
    final response = await DioHelper.getData(url: basketUrl, token: token);
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return BasketGetOrdersModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<UpdateBasketModel> updateBasketOrderData({required int productId,required int quantity,}
     ) async {
    final response = await DioHelper.putData(
      url: '$updateQuantityOrdersUrl$productId',
      token: token,
      data: {
        'quantity': quantity,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      log(data.toString());
      return UpdateBasketModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<AddToBasketModel> deleteOrderFromBasketData(int productId) async {
    final response = await DioHelper.deleteData(
      url: '$deleteOrdersUrl$productId',
      token: token,
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddToBasketModel.fromJson(data);
    }
    //todo handle message data['message'] to show toast in screen (product add to basket success)
    throw 'server error';
  }
}
