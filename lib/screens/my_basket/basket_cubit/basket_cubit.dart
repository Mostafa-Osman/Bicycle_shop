import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/my_basket/model/add_order_model.dart';
import 'package:udemy_flutter/screens/my_basket/model/basket_model.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/states.dart';

import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(BasketInitialState());

  static BasketCubit get(context) => BlocProvider.of(context);

  //add order to my basket

  void addToBasketOrders(int productId) {
    emit(AddToBasketLoadingState());
    DioHelper.postData(
      url: ADD_TO_BASKET_ORDER,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      emit(AddToBasketSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddToBasketErrorState());
    });
  }

  //get orders to basket
  BasketModel? myBag;

  void getMyBasketData() {
    emit(ShopGetOrderLoadingState());
    DioHelper.getData(url: ADD_TO_BASKET_ORDER, token: token).then((value) {
      myBag = BasketModel.fromJson(value.data);

      emit(ShopGetOrderSuccessState(myBag!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetOrderErrorState());
    });
  }

  //update quantity of orders in basket

  void updateBasketOrderData({required quantity, required int cartId}) {
    emit(BasketUpdateQuantityLoadingState());
    DioHelper.putData(
        url: UPDATE_QUANTITY_ORDERS + '$cartId',
        token: token,
        data: {'quantity': quantity}).then((value) {
      myBag = BasketModel.fromJson(value.data);
      emit(BasketUpdateQuantitySuccessState(myBag!));
      getMyBasketData();
    }).catchError((error) {
      print(error.toString());
      emit(BasketUpdateQuantityErrorState());
    });
  }

  //delete orders from basket
  void deleteOrderFromBasketData({required int cartId}) {
    emit(DeleteFromBasketLoadingState());
    DioHelper.deleteData(
      url: DELETE_ORDERS + '$cartId',
      token: token,
    ).then((value) {
      emit(DeleteFromBasketSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFromBasketErrorState());
    });
  }

  //complete make order and add to get it

  AddOrderModel? makeOrders;

  void makeOrderData(addressId, paymentMethod, usePoints, discount, vat) {
    emit(MakeOrderLoadingState());
    DioHelper.postData(url: ADD_ORDER, token: token, data: {
      'address_id': addressId,
      'payment_method': paymentMethod,
      'discount': discount,
      'use_points': usePoints,
      'vat': vat,
    }).then((value) {
      makeOrders = AddOrderModel.fromJson(value.data);
      emit(MakeOrderSuccessState(myBag!));
    }).catchError((error) {
      print(error.toString());
      emit(MakeOrderErrorState());
    });
  }
}
