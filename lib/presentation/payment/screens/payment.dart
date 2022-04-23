import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/address.dart';
import 'package:udemy_flutter/presentation/payment/widgets/bottom_nav.dart';
import 'package:udemy_flutter/presentation/payment/widgets/discount_and_voucher.dart';
import 'package:udemy_flutter/presentation/payment/widgets/promo_code.dart';
import 'package:udemy_flutter/presentation/payment/widgets/select_payment__method.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    final basketCubit = BlocProvider.of<BasketCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Payment', textColor: mainColor),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is MakeOrderSuccess) {
            showToast(
              message: 'order completed successfully',
              state: ToastStates.success,
            );
            BlocProvider.of<HistoryOrdersCubit>(context).getOrders();
          }
        },
        builder: (context, state) {
          if (state is EstimateOrderError) {
            return const Text('Error');
          } else if (state is EstimateOrderLoading) {
            return const Center(child: CustomLoading());
          } else if (basketCubit.myBag.data.cartItems.isEmpty) {
            return EmptyScreen();
          } else {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            //select pay
                            SelectPaymentMethod(),
                            const SizedBox(height: 10.0),
                            // option to use discount points or not
                            DiscountAndVoucher(),
                            const SizedBox(height: 10.0),
                            // option to use promo code or not
                            if (paymentCubit.usePromoCode == 0) PromoCode(),
                            if (paymentCubit.usePromoCode == 0)
                              const SizedBox(height: 20.0),
                            // select address
                            AddressPayment(),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PaymentBottomNavBar()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
