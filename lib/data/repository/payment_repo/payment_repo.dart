import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/payment_model/cost_orders_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';

class PaymentRepository {
  final UserPrefs userPrefs;
  const PaymentRepository(this.userPrefs);
  // make  order
  Future<CostOrdersModel> makeOrderData({
    required int addressId,
    required int paymentMethod,
    required bool usePoints,
  }) async {
    final response = await DioHelper.postData(
      url: addOrdersUrl,
      token: userPrefs.getUserToken(),
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
      token: userPrefs.getUserToken(),
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
  //todo promo code
  //promo code
  // Future<PromoCodeModel> promoCode({required String code}) async {
  //   final response = await DioHelper.postData(
  //     url: promoCodeUrl,
  //     token: userPrefs.getUserToken(),
  //     data: {
  //       'code': code,
  //     },
  //   );
  //   final data = response.data as Map<String, dynamic>;
  //   if (data['status'] == true) {
  //     return PromoCodeModel.fromJson(data);
  //   }
  //   throw 'server error';
  // }
}
