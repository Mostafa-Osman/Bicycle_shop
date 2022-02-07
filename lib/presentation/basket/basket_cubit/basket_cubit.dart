import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/basket_repo/basket_repo.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/states.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_model.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(BasketInitialState());

  static BasketCubit get(context) => BlocProvider.of(context);


  //add order to my basket
  final basketRepo = BasketRepo();

  //get orders to basket
  BasketModel? myBag;

  Future<void> addToBasketOrders(int productId) async {
    emit(AddToBasketLoadingState());
    try {
      myBag = await basketRepo.addToBasketOrders(productId);
      emit(AddToBasketSuccessState(myBag));
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(AddToBasketErrorState());
    }
  }

  Future<void> getMyBasketData() async {
    emit(ShopGetOrderLoadingState());
    try {
      myBag = await basketRepo.getMyBasketData();
      emit(ShopGetOrderSuccessState());
    } catch (error) {
      print(error.toString());
      emit(ShopGetOrderErrorState());
    }
  }

  //update quantity of orders in basket
  Future<void> updateBasketOrderData(
      {required int productId, required quantity}) async {
    emit(BasketUpdateQuantityLoadingState());
    try {
      myBag = await basketRepo.updateBasketOrderData(productId, quantity);
      emit(BasketUpdateQuantitySuccessState(myBag!));
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(BasketUpdateQuantityErrorState());
    }
  }

  //delete orders from basket
  Future<void> deleteOrderFromBasketData({required int productId}) async {
    emit(DeleteFromBasketLoadingState());

    try {
      basketRepo.deleteOrderFromBasketData(productId);
      emit(DeleteFromBasketSuccessState());
      getMyBasketData();
    } catch (error) {
      print(error.toString());
      emit(DeleteFromBasketErrorState());
    }
  }
}
