
import 'package:udemy_flutter/data/models/basket_model/basket_model.dart';

abstract class BasketStates {}

class BasketInitialState extends BasketStates {}

class AddToBasketLoadingState extends BasketStates {}

class AddToBasketSuccessState extends BasketStates {
  final myBag;

  AddToBasketSuccessState(this.myBag);
}

class AddToBasketErrorState extends BasketStates {}

class BasketUpdateQuantityLoadingState extends BasketStates {}

class BasketUpdateQuantitySuccessState extends BasketStates {
  final BasketModel updateQuantityModel;

  BasketUpdateQuantitySuccessState(this.updateQuantityModel);
}

class BasketUpdateQuantityErrorState extends BasketStates {}

class DeleteFromBasketLoadingState extends BasketStates {}

class DeleteFromBasketSuccessState extends BasketStates {}

class DeleteFromBasketErrorState extends BasketStates {}

class ShopGetOrderLoadingState extends BasketStates {}

class ShopGetOrderSuccessState extends BasketStates {

}

class ShopGetOrderErrorState extends BasketStates {}



