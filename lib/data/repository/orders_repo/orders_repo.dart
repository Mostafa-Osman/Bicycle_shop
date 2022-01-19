import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/orders/model/my_orders.dart';
import 'package:udemy_flutter/screens/orders_details/model/order_detail.dart';
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
          url: 'orders/' + '${orderId}' + '/cancel', token: token);
      if (response.data['status'] == true) {
        return OrderDetailsResponse.fromJson(response.data).orderDetails!;
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
