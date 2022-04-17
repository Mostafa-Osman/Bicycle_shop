import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';
import 'package:udemy_flutter/data/models/orders_model/my_orders.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class OrdersRepository {
  Future<MyOrderModel> getOrder() async {
    final response = await DioHelper.getData(url: myOrdersUrl, token: token);

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return MyOrderModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<OrderDetailsResponse> getOrderDetails(int orderId) async {
    final response = await DioHelper.getData(
      url: '$ordersDetailsUrl$orderId',
      token: token,
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return OrderDetailsResponse.fromJson(data);
    }
    throw 'server error';
  }

  Future<OrderDetailsResponse> cancelOrder(int orderId) async {

      final response = await DioHelper.getData(
        url: 'orders/$orderId/cancel',
        token: token,
      );

      final data = response.data as Map<String, dynamic>;
      if (data['status'] == true) {
        return OrderDetailsResponse.fromJson(data);
      }
      throw 'server error';


  }
}
