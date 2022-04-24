import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/product_details_model/product_details_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class ProductDetailsRepository {
  Future<ProductDetailsModel> getProductDetailsData({required int productId}) async {
    final response =
    await DioHelper.getData(url: productsDetailsUrl+productId.toString(), token: token);
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return ProductDetailsModel.fromJson(data);
    }
    throw 'server error';
  }
}
