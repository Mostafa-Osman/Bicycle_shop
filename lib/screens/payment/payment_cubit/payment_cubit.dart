import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  bool isOnline = false;
  int discountTabTextIndexSelected = 1;
  int voucherTabTextIndexSelected = 1;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  TabController? tabController;
  ValueNotifier<int> current = ValueNotifier(0);
  var labelText=["Yes", "No"];

  isOnlinePayment() {
    emit(IsOnlineState());
    isOnline = !isOnline;
  }

  //credit card
  onCreditCardModelChange(creditCardModel) {
    emit(CreditCardModelChangeSuccess());
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
  }

  changeDiscount(index) {
    emit(SwitchDiscountState());
    discountTabTextIndexSelected =index;

  }

  changeVoucher(index) {
    emit(SwitchVoucherState());
    voucherTabTextIndexSelected =index;

  }
}
