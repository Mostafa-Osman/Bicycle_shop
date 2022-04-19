import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_get_orders_model.dart';
import 'package:udemy_flutter/data/repository/basket_repo/basket_repo.dart';

part 'basket_states.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit(this.basketRepository) : super(BasketInitialState());

  //add order to my basket
  final BasketRepository basketRepository;

  //get orders to basket
  late BasketGetOrdersModel myBag;

  Future<void> addToBasketOrders(int productId) async {
    emit(AddToBasketLoading());
    try {
      await basketRepository.addToBasketOrders(productId);
      emit(AddToBasketSuccess());
      getMyBasketData();
    } catch (error, s) {
      log('add to basket orders data', error: error, stackTrace: s);
      emit(AddToBasketError(error.toString()));
    }
  }

  Future<void> getMyBasketData() async {
    emit(BasketGetOrderLoading());
    try {
      myBag = await basketRepository.getMyBasketData();
      emit(BasketGetOrderSuccess());
    } catch (error, s) {
      log('get myBasket data', error: error, stackTrace: s);
      emit(BasketGetOrderError(error.toString()));
    }
  }

  //update quantity of orders in basket
  Future<void> updateBasketOrderData({
    required int productId,
    required int quantity,
  }) async {
    emit(BasketUpdateQuantityLoading());
    try {
      await basketRepository.updateBasketOrderData(
        productId: productId,
        quantity: quantity,
      );
      // getMyBasketData();

      emit(BasketUpdateQuantitySuccess());
    } catch (error, s) {
      log('update basket orders data', error: error, stackTrace: s);
      emit(BasketUpdateQuantityError(error.toString()));
    }
  }

  //delete orders from basket
  Future<void> deleteOrderFromBasketData({required int productId}) async {
    emit(DeleteFromBasketLoading());

    try {
      basketRepository.deleteOrderFromBasketData(productId);
      emit(DeleteFromBasketSuccess());
      getMyBasketData();
    } catch (error, s) {
      log('delete basket orders data', error: error, stackTrace: s);
      emit(DeleteFromBasketError(error.toString()));
    }
  }

  void quantityItem({required bool isIncrement, required int index}) {
    if (isIncrement) {
      myBag.data.cartItems[index].quantity++;
      updateBasketOrderData(
        quantity: myBag.data.cartItems[index].quantity,
        productId: myBag.data.cartItems[index].id,
      );
    } else {
      if (myBag.data.cartItems[index].quantity > 1) {
        myBag.data.cartItems[index].quantity--;
        updateBasketOrderData(
          quantity: myBag.data.cartItems[index].quantity,
          productId: myBag.data.cartItems[index].id,
        );
      }
    }
    emit(AddToBasketRefreshUi());
  }
}
