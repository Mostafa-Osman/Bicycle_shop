import 'package:udemy_flutter/screens/favourites/model/change_favourites_model.dart';

abstract class FavouriteStates {}

class FavouritesInitial extends FavouriteStates {}

class ChangeFavorites extends FavouriteStates {}

class ChangeFavoritesSuccess extends FavouriteStates {}

class ChangeFavoritesError extends FavouriteStates {}

class GetFavoritesLoading extends FavouriteStates {}

class GetFavoritesSuccess extends FavouriteStates {}

class GetFavoritesError extends FavouriteStates {}
