import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/basket_model/add_order_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/data/models/payment_model/promo_code.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class PaymentRepo {
  // make  order
  Future<AddOrderModel> makeOrderData(
      addressId, paymentMethod, usePoints) async {
    try {
      final response =
          await DioHelper.postData(url: ADD_ORDER, token: token, data: {
        'address_id': addressId,
        'payment_method': paymentMethod,
        'use_points': usePoints,
      });
      if (response.data['status'] == true) {
        return AddOrderModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  //Estimate order
  Future<EstimateModel> estimateOrdersData(usePoints
     // , promoCodeId
      ) async {
    try {
      final response = await DioHelper.postData(
        url: ESTIMATE_ORDER,
        token: token,
        data: {
          'use_points': usePoints,
         // 'promo_code_id': promoCodeId,
        },
      );
      if (response.data['status'] == true) {
        return EstimateModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  //promo code
  Future<PromoCodeModel> promoCode(code) async {
    try {
      final response = await DioHelper.postData(
        url: PROMO_CODE,
        token: token,
        data: {
          'code': code,
        },
      );
      if (response.data['status'] == true) {
        return PromoCodeModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
