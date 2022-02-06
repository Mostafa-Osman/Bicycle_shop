import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/home_model/banner_model.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class HomeRepo {
  // get Home
  Future<HomeModel> getHomeData() async {
    try {
      final response = await DioHelper.getData(url: PRODUCT_DETAILS, token: token);
      if (response.data['status'] == true) {
        return HomeModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  Future<BannerModel> getBannerData() async {
    try {
      final response = await DioHelper.getData(url: BANNER, token: token);
      if (response.data['status'] == true) {
        return BannerModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
