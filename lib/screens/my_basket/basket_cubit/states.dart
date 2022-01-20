import 'package:udemy_flutter/screens/my_basket/model/basket_model.dart';

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
  final BasketModel model;

  ShopGetOrderSuccessState(this.model);
}

class ShopGetOrderErrorState extends BasketStates {}


class MakeOrderLoadingState extends BasketStates {}

class  MakeOrderSuccessState extends BasketStates {
  final BasketModel model;

  MakeOrderSuccessState(this.model);
}

class  MakeOrderErrorState extends BasketStates {}

