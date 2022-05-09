import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/payment_model/cost_orders_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/data/models/payment_model/promo_code.dart';
import 'package:udemy_flutter/data/repository/payment_repo/payment_repo.dart';

part 'payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.paymentRepository) : super(PaymentInitial());

  bool isOnline = false;
  int enableDiscountPoints = 1;
  int usePromoCode = 1;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  List<String> labelText = ["Yes", "No"];

  //complete make order and add to get it

  late CostOrdersModel makeOrders;
  final PaymentRepository paymentRepository;

  int addressIndex = 0;
  late PromoCodeModel promoCodeModel;
   EstimateModel? estimatePrice;

  void isOnlinePayment({required bool onlinePayment}) {
    isOnline =onlinePayment;
    emit(PaymentRefreshUi());
  }


  void changeDiscountPoints(int index) {
    enableDiscountPoints = index;
    emit(PaymentRefreshUi());
  }


  void changePromoCode(int index) {
    usePromoCode = index;
    emit(PaymentRefreshUi());
  }

  Future<void> makeOrderData({
    required int addressId,
  }) async {
    emit(MakeOrderLoading());
    try {
      makeOrders = await paymentRepository.makeOrderData(
        addressId: addressId,
        paymentMethod: isOnline ? 2 : 1,
        // ignore: avoid_bool_literals_in_conditional_expressions
        usePoints: enableDiscountPoints == 0 ? true : false,
      );
      emit(MakeOrderSuccess());
    } catch (error, s) {
      log('make order data', error: error, stackTrace: s);
      emit(MakeOrderError(error.toString()));
    }
  }

  Future<void> estimateOrdersData(//  , promoCodeId
      ) async {
    emit(EstimateOrderLoading());
    try {
      estimatePrice = await paymentRepository.estimateOrdersData(
        // ignore: avoid_bool_literals_in_conditional_expressions
        usePoints: enableDiscountPoints == 0 ? true : false,
        //   , promoCodeId
      );
      emit(EstimateOrderSuccess());
    } catch (error, s) {
      log('estimate orders data', error: error, stackTrace: s);
      emit(EstimateOrderError(error.toString()));
    }
  }

  Future<void> promoCode({required String code}) async {
    emit(PromoCodeLoading());
    try {
      promoCodeModel = await PaymentRepository().promoCode(code: code);
      emit(PromoCodeSuccess());
    } catch (error, s) {
      log('promo code data', error: error, stackTrace: s);
      emit(PromoCodeError(error.toString()));
    }
  }

  void changeAddressIndex(int index) {
    addressIndex = index;
    emit(PaymentRefreshUi());
  }
}
