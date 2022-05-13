import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/favourite_model/change_favourites_model.dart';
import 'package:udemy_flutter/data/models/favourite_model/favourites_model.dart';

class FavouriteRepository {
  final UserPrefs userPrefs;

  const FavouriteRepository(this.userPrefs);
  // get favourites
  Future<FavouritesModel> getFavouritesData() async {
    final response = await DioHelper.getData(url: favoritesUrl, token: userPrefs.getUserToken());

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return FavouritesModel.fromJson(data);
    }
    throw 'server error';
  }

  // change favourites
  Future<ChangeFavoritesModel> changeFavorites(int productId) async {
    final response = await DioHelper.postData(
      url: favoritesUrl,
      data: {
        'product_id': productId,
      },
      token: userPrefs.getUserToken(),
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return ChangeFavoritesModel.fromJson(data);
    }
    throw 'server error';
  }
}
