import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/favourit_model/favourites_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class FavouriteRepository {
  // get favourites
  Future<FavouritesModel> getFavouritesData() async {
    final response = await DioHelper.getData(url: favoritesUrl, token: token);

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return FavouritesModel.fromJson(data);
    }
    throw 'server error';
  }

  // change favourites
  Future<FavouritesModel> changeFavorites(int productId) async {
    final response = await DioHelper.postData(
      url: favoritesUrl,
      data: {
        'product_id': productId,
      },
      token: token,
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return FavouritesModel.fromJson(data);
    }
    throw 'server error';
  }
}
