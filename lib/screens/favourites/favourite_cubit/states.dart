import 'package:udemy_flutter/screens/favourites/model/change_favourites_model.dart';

abstract class FavouriteStates {}

class FavouritesInitialState extends FavouriteStates {}
class ChangeFavoritesState extends FavouriteStates {}

class ChangeFavoritesSuccessState extends FavouriteStates {
  final ChangeFavouritesModel model;

  ChangeFavoritesSuccessState(this.model);
}

class ChangeFavoritesErrorState extends FavouriteStates {}

class GetFavoritesLoadingState extends FavouriteStates {}

class GetFavoritesSuccessState extends FavouriteStates {}

class GetFavoritesErrorState extends FavouriteStates {}