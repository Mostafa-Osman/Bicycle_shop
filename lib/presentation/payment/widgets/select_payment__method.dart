import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SelectPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (BuildContext context, state) {
        return CustomCard(
          paddingTop: 10.0,
          paddingLeft: 5.0,
          paddingBottom: 10.0,
          width: double.infinity,
          widget: Column(
            children: [
              InkWell(
                onTap: () {
                  paymentCubit.isOnlinePayment();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Stack(
                    children: [
                      if (!paymentCubit.isOnline)
                        Positioned(
                          right: 10.0,
                          child: SvgPicture.asset(
                            'assets/icons/done.svg',
                          ),
                        ),
                      const CustomText(
                        text: 'Cash',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textColor: black,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  paymentCubit.isOnlinePayment();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 17.0, left: 10.0),
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Stack(
                    children: [
                      if (paymentCubit.isOnline)
                        Positioned(
                          right: 10.0,
                          child: SvgPicture.asset(
                            'assets/icons/done.svg',
                          ),
                        ),
                      const CustomText(
                        text: 'Online',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textColor: black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
