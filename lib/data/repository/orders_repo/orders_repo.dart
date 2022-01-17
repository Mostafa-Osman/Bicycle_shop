import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/orders/model/order_detail.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class OrdersRepo {
  // object from dio and cash helper
  // pass it to constructor
  // use get it lib for dependency injection

  Future<OrderDetailsModel> getOrderDetails(int orderId) async {
    try {
      final response =
          await DioHelper.getData(url: ORDER_DETAILS + '$orderId', token: token);
      if (response.data['status'] == true) {
        return OrderDetailsResponse.fromJson(response.data).orderDetails!;
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
