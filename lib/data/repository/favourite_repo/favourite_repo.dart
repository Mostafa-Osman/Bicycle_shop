import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/favourites/model/favourites_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class FavouriteRepo {
  // get favourites
  Future<FavouritesModel> getFavouritesData() async {
    try {
      final response = await DioHelper.getData(url: FAVORITES, token: token);
      if (response.data['status'] == true) {
        return FavouritesModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  // change favourites
  Future<FavouritesModel> changeFavorites(productId) async {
    try {
      final response = await DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id': productId,
        },
        token: token,
      );
      if (response.data['status'] == true) {
        return FavouritesModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
