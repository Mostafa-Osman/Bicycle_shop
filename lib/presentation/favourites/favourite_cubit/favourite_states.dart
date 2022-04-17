part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteStates {}

class FavouritesInitial extends FavouriteStates {}

class ChangeFavorites extends FavouriteStates {}

class ChangeFavoritesSuccess extends FavouriteStates {}

class ChangeFavoritesError extends FavouriteStates {
  final String message;

  ChangeFavoritesError(this.message);
}

class GetFavoritesLoading extends FavouriteStates {}

class GetFavoritesSuccess extends FavouriteStates {}

class GetFavoritesError extends FavouriteStates {
  final String message;

  GetFavoritesError(this.message);
}
