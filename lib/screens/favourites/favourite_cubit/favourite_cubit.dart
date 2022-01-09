import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/favourites/model/change_favourites_model.dart';
import 'package:udemy_flutter/screens/favourites/model/favourites_model.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/states.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouritesInitialState());

  static FavouriteCubit get(context) => BlocProvider.of(context);
  var changeFavouritesModel;

  void changeFavorites(int productId,context) {
    HomeCubit.get(context).favourites[productId] = !HomeCubit.get(context).favourites[productId];
    emit(ChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavouritesModel = ChangeFavouritesModel.fromJson(value.data);
      if (!changeFavouritesModel.status)
        HomeCubit.get(context).favourites[productId] = !HomeCubit.get(context).favourites[productId];
      else
        getFavouritesData();

      emit(ChangeFavoritesSuccessState(changeFavouritesModel));
      emit(GetFavoritesSuccessState());
    }).catchError((onError) {
      HomeCubit.get(context).favourites[productId] = !HomeCubit.get(context).favourites[productId];
      emit(ChangeFavoritesErrorState());
    });
  }

  FavouritesModel? favouritesModel;

  void getFavouritesData() {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      emit(GetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesErrorState());
    });
  }

}