import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/home_model/banner_model.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class HomeRepository {
  // get Home
  Future<HomeModel> getHomeData() async {
    final response =
        await DioHelper.getData(url: productsUrl, token: token);
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return HomeModel.fromJson(data);
    }
    throw 'server error';
  }

  Future<BannerModel> getBannerData() async {
    final response = await DioHelper.getData(url: bannerUrl, token: token);
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return BannerModel.fromJson(data);
    }
    throw 'server error';
  }
}
