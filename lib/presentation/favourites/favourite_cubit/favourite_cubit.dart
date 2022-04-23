import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/favourite_model/favourites_model.dart';
import 'package:udemy_flutter/data/repository/favourite_repo/favourite_repo.dart';

part 'favourite_states.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit(this.favouritesRepo) : super(FavouritesInitial());

  final FavouriteRepository favouritesRepo;

  bool isFavourite = false;
  late FavouritesModel favouritesModel;

  Future<void> getFavouritesData() async {
    emit(GetFavoritesLoading());
    try {
      favouritesModel = await favouritesRepo.getFavouritesData();
      emit(GetFavoritesSuccess());
    } catch (error, s) {
      log('get favourites data', error: error, stackTrace: s);
      emit(GetFavoritesError(error.toString()));
    }
  }

  Future<void> changeFavourites(int productId) async {
    emit(ChangeFavorites());
    try {
      await favouritesRepo.changeFavorites(productId);
      getFavouritesData();
      emit(ChangeFavoritesSuccess());
    } catch (error, s) {
      log('change favorites data', error: error, stackTrace: s);
      emit(ChangeFavoritesError(error.toString()));
    }
  }
}
