import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/search_model/search_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class SearchRepository {
  Future<SearchModel> getSearchData({required String text}) async {
    final response = await DioHelper.postData(
      url: searchUrl,
      data: {'text': text},
      token: userToken,
    );
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return SearchModel.fromJson(data);
    }
    throw 'server error';
  }
}
