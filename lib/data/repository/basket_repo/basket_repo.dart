import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/favourites/model/favourites_model.dart';
import 'package:udemy_flutter/screens/my_basket/model/basket_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class BasketRepo {
  // add To Basket Orders
  Future<BasketModel> addToBasketOrders(productId) async {
    try {
      final response = await DioHelper.postData(
        url: BASKET,
        data: {'product_id': productId},
        token: token,
      );
      if (response.data['status'] == true) {
        return BasketModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  // get My Basket Data
  Future<BasketModel> getMyBasketData() async {
    try {
      final response =
          await DioHelper.getData(url: BASKET, token: token);
      if (response.data['status'] == true) {
        return BasketModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  Future<BasketModel> updateBasketOrderData(productId,quantity) async {
    try {
      final response =
      await  DioHelper.putData(
          url: UPDATE_QUANTITY_ORDERS + '$productId',
          token: token,
          data: {'quantity': quantity});
      if (response.data['status'] == true) {
        return BasketModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  Future<BasketModel> deleteOrderFromBasketData(productId) async {
    try {
      final response =
      await  DioHelper.deleteData(
        url: DELETE_ORDERS + '$productId',
        token: token,
      );
      if (response.data['status'] == true) {
        return BasketModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}




