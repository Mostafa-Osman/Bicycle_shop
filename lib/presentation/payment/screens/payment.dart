import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/address.dart';
import 'package:udemy_flutter/presentation/payment/widgets/bottom_nav.dart';
import 'package:udemy_flutter/presentation/payment/widgets/discount_and_voucher.dart';
import 'package:udemy_flutter/presentation/payment/widgets/promo_code.dart';
import 'package:udemy_flutter/presentation/payment/widgets/select_payment__method.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Payment', textColor: mainColor),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocBuilder<PaymentCubit, PaymentStates>(
        //todo handle states
        builder: (context, state) {
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
                          const SizedBox(height: 130.0),
                        ],
                      ),
                    ),
                  ),
                ),
                PaymentBottomNavBar()

              ],
            ),
          );
        },
      ),
    );
  }
}
