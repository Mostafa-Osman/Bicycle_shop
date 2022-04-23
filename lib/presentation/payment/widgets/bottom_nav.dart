import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/showd_details_price.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.only(right: 10.0, left: 15.0, top: 10),
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text:
                        ' Total: ${paymentCubit.estimatePrice.data.total.ceil()} EGP',
                    fontSize: 18.0,
                    textColor: mainColor,
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      'show details',
                      style: TextStyle(
                        fontSize: 15,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ShowDetailsPrice(
                          detailsPrice: paymentCubit.estimatePrice.data,
                        );
                      },
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: 'Complete orders now',
                onPressed: () {
                  if (addressCubit.addressModel.data.isEmpty) {
                    showToast(
                      state: ToastStates.warning,
                      message: 'please add address',
                    );
                  } else {
                    paymentCubit.makeOrderData(
                      addressId: addressCubit
                          .addressModel.data[paymentCubit.addressIndex].id,
                    );
                    basketCubit.myBag.data.cartItems.clear();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
