
part of 'basket_cubit.dart';

abstract class BasketStates {}

class BasketInitialState extends BasketStates {}

class AddToBasketLoading extends BasketStates {}

class AddToBasketSuccess extends BasketStates {

}

class AddToBasketError extends BasketStates {
  final String message;
   AddToBasketError(this.message);
}

class BasketUpdateQuantityLoading extends BasketStates {}

class BasketUpdateQuantitySuccess extends BasketStates {

}

class BasketUpdateQuantityError extends BasketStates {
  final String message;
  BasketUpdateQuantityError(this.message);
}

class DeleteFromBasketLoading extends BasketStates {}

class DeleteFromBasketSuccess extends BasketStates {}

class DeleteFromBasketError extends BasketStates {  final String message;
DeleteFromBasketError(this.message);}

class BasketGetOrderLoading extends BasketStates {}

class BasketGetOrderSuccess extends BasketStates {

}

class BasketGetOrderError extends BasketStates {
  final String message;
  BasketGetOrderError(this.message);
}
