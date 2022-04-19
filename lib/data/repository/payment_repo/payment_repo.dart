import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/payment_model/cost_orders_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/data/models/payment_model/promo_code.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class PaymentRepository {
  // make  order
  Future<CostOrdersModel> makeOrderData({
    required int addressId,
    required int paymentMethod,
    required bool usePoints,
  }) async {
    final response = await DioHelper.postData(
      url: addOrdersUrl,
      token: token,
      data: {
        'address_id': addressId,
        'payment_method': paymentMethod,
        'use_points': usePoints,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return CostOrdersModel.fromJson(data);
    }
    throw 'server error';
  }

  //Estimate order
  Future<EstimateModel> estimateOrdersData({
    required bool usePoints,
  }
      // , promoCodeId
      ) async {
    final response = await DioHelper.postData(
      url: estimateOrderUrl,
      token: token,
      data: {
        'use_points': usePoints,
        // 'promo_code_id': promoCodeId,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return EstimateModel.fromJson(data);
    }
    throw 'server error';
  }

  //promo code
  Future<PromoCodeModel> promoCode({required String code}) async {
    final response = await DioHelper.postData(
      url: promoCodeUrl,
      token: token,
      data: {
        'code': code,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return PromoCodeModel.fromJson(data);
    }
    throw 'server error';
  }
}
