import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/repository/favourite_repo/favourite_repo.dart';
import 'package:udemy_flutter/screens/favourites/model/change_favourites_model.dart';
import 'package:udemy_flutter/screens/favourites/model/favourites_model.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/states.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouritesInitialState());

  static FavouriteCubit get(context) => BlocProvider.of(context);
  var changeFavouritesModel;
  final favouritesRepo = FavouriteRepo();
  FavouritesModel? favouritesModel;

  Future<void> getFavouritesData() async {
    emit(GetFavoritesLoadingState());
    try {
      favouritesModel = await favouritesRepo.getFavouritesData();
      emit(GetFavoritesSuccessState());
    } catch (e, s) {
      print(s.toString());
      emit(GetFavoritesErrorState());
    }
  }

  void changeFavorites(int productId, context) async {
    emit(ChangeFavoritesState());
    try {
      changeFavouritesModel = await favouritesRepo.changeFavorites(productId);
      HomeCubit.get(context).favourites[productId] = !HomeCubit.get(context).favourites[productId];
      emit(ChangeFavoritesSuccessState());
      getFavouritesData();
    } catch (onError) {
      emit(ChangeFavoritesErrorState());
    }
  }
}
