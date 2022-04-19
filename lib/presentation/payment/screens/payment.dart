import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/address.dart';
import 'package:udemy_flutter/presentation/payment/widgets/bottom_nav.dart';
import 'package:udemy_flutter/presentation/payment/widgets/discount_points.dart';
import 'package:udemy_flutter/presentation/payment/widgets/select_payment__method.dart';

import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          return
            SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
              child: Column(
                children: [
                  //select pay
                  SelectPaymentMethod(),
                  // option to use discount points or not
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: DiscountPoints(),
                  ),
                  //  option to use promo code or not
                  // PromoCode(),
                  // SizedBox(height: 20.0),
                  //select address
                  AddressPayment(),
                  PaymentBottomNavBar()
                ],
              ),
            ),
          );
        },
      ),

      // bottom Navigation Bar
      // bottomNavigationBar: PaymentBottomNavBar(),
    );
  }
}
