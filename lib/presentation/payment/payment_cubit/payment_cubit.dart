import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/payment_model/cost_orders_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/data/models/payment_model/promo_code.dart';
import 'package:udemy_flutter/data/repository/payment_repo/payment_repo.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

part 'payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.paymentRepository) : super(PaymentInitial());

  bool isOnline = false;
  int discountTabTextIndexSelected = 1;
  int voucherTabTextIndexSelected = 1;
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
  late EstimateModel estimatePrice;

  void isOnlinePayment() {
    isOnline = !isOnline;
    emit(PaymentRefreshUi());
  }

  // //credit card
  // void onCreditCardModelChange(CreditCardModel creditCardModel) {
  //   emit(PaymentRefreshUi());
  //   cardNumber = creditCardModel.cardNumber;
  //   expiryDate = creditCardModel.expiryDate;
  //   cardHolderName = creditCardModel.cardHolderName;
  //   cvvCode = creditCardModel.cvvCode;
  //   isCvvFocused = creditCardModel.isCvvFocused;
  // }

  void changeDiscount(int index) {
    emit(PaymentRefreshUi());
    discountTabTextIndexSelected = index;
  }

  void changeVoucher(int index) {
    voucherTabTextIndexSelected = index;
    emit(PaymentRefreshUi());
  }

  Future<void> makeOrderData({
      required int addressId,
      }
      ) async {
    emit(MakeOrderLoading());
    try {
      makeOrders = await paymentRepository.makeOrderData(
        addressId:addressId ,
        paymentMethod: isOnline ? 1 : 2,
        // ignore: avoid_bool_literals_in_conditional_expressions
        usePoints: discountTabTextIndexSelected == 0 ? true : false,
      );
      emit(MakeOrderSuccess());
    } catch (error, s) {
      log('make order data', error: error, stackTrace: s);
      emit(MakeOrderError(error.toString()));
    }
  }

  // Future<void> estimateOrdersData(//  , promoCodeId
  //     ) async {
  //   emit(EstimateOrderLoading());
  //   try {
  //     estimatePrice = await paymentRepository.estimateOrdersData(
  //       // ignore: avoid_bool_literals_in_conditional_expressions
  //       usePoints: discountTabTextIndexSelected == 0 ? true : false,
  //       //   , promoCodeId
  //     );
  //     emit(EstimateOrderSuccess());
  //   } catch (error, s) {
  //     log('estimate orders data', error: error, stackTrace: s);
  //     emit(EstimateOrderError(error.toString()));
  //   }
  // }
  //
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

  Color backgroundTextAddress = const Color(0xffE0E0E0);
  Color textColor = black;

  void addressStyle(int index) {
    if (addressIndex == index) {
      backgroundTextAddress = lightMainColor;
      textColor = mainColor;
    } else {
      textColor = black;
      backgroundTextAddress = const Color(0xffE0E0E0);
    }
    emit(PaymentRefreshUi());
  }
}
