import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/favourite_repo/favourite_repo.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/states.dart';
import 'package:udemy_flutter/data/models/favourit_model/favourites_model.dart';


class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouritesInitial());

  static FavouriteCubit get(context) => BlocProvider.of(context);
  var changeFavouritesModel;
  final favouritesRepo = FavouriteRepo();
  bool isFavourite=false;
  FavouritesModel? favouritesModel;

  Future<void> getFavouritesData() async {
    emit(GetFavoritesLoading());
    try {
      favouritesModel = await favouritesRepo.getFavouritesData();
      emit(GetFavoritesSuccess());
    } catch (e, s) {
      print(s.toString());
      emit(GetFavoritesError());
    }
  }

  Future<void> changeFavorites(int productId, context) async {
    emit(ChangeFavorites());
    try {
      changeFavouritesModel = await favouritesRepo.changeFavorites(productId);
      emit(ChangeFavoritesSuccess());
      getFavouritesData();
    } catch (onError) {
      log(onError.toString());
      emit(ChangeFavoritesError());
    }
  }

}
