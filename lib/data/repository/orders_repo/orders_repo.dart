import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/orders_model/my_orders.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class OrdersRepo {
  // object from dio and cash helper
  // pass it to constructor
  // use get it lib for dependency injection

  Future<MyOrderModel> getOrder() async {
    try {
      final response = await DioHelper.getData(url: MY_ORDERS, token: token);
      if (response.data['status'] == true) {
        return MyOrderModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderDetailsModel> getOrderDetails(int orderId) async {
    try {
      final response = await DioHelper.getData(
          url: ORDER_DETAILS + '$orderId', token: token);
      if (response.data['status'] == true) {
        return OrderDetailsResponse.fromJson(response.data).orderDetails!;
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderDetailsModel> cancelOrder(int orderId) async {
    try {
      final response = await DioHelper.getData(
          url: 'orders/' + '$orderId' + '/cancel', token: token);
      if (response.data['status'] == true) {
        // should change it
        showToast(state: ToastStates.SUCCESS, message: 'cancel order success');
        return OrderDetailsResponse.fromJson(response.data).orderDetails!;

      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
