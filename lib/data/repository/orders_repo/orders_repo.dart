import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/history_orders_model/history_orders.dart';
import 'package:udemy_flutter/data/models/order_details_model/cancel_order_model.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';

class OrdersRepository {
 final  UserPrefs userPrefs;
  const OrdersRepository(this.userPrefs);
  Future<HistoryOrdersModel> getOrder() async {
    final response = await DioHelper.getData(url: myOrdersUrl, token: userPrefs.getUserToken());

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return HistoryOrdersModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<OrderDetailsModel> getOrderDetails(int orderId) async {
    final response = await DioHelper.getData(
      url: '$ordersDetailsUrl$orderId',
      token: userPrefs.getUserToken(),
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return OrderDetailsModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<CancelOrderModel> cancelOrder(int orderId) async {

      final response = await DioHelper.getData(
        url: 'orders/$orderId/cancel',
        token: userPrefs.getUserToken(),
      );

      final data = response.data as Map<String, dynamic>;
      if (data['status'] == true) {
        return CancelOrderModel.fromJson(data);
      }
      throw 'server error';


  }
}
