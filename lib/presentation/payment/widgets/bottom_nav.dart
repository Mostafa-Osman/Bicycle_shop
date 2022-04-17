import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/showd_details_price.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context).addressModel;
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return BlocBuilder(
      builder: (BuildContext context, state) {
        if (state is EstimateOrderLoading) {
          return const CustomLoading();
        } else if (state is EstimateOrderError) {
          return const Text('Error');
        } else {
          return Container(
            padding: const EdgeInsets.only(right: 10.0, left: 15.0, top: 10),
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text:
                          ' Total: ${paymentCubit.estimatePrice.data.total} EGP',
                      fontSize: 18.0,
                      textColor: mainColor,
                    ),
                    const Spacer(),
                    CustomTextButton(
                      text: 'show details',
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
                    if (addressCubit.data.isEmpty) {
                      showToast(
                        state: ToastStates.warning,
                        message: 'please add address',
                      );
                    } else {
                      paymentCubit.makeOrderData(
                        addressId:
                            addressCubit.data[paymentCubit.addressIndex].id,
                      );
                      basketCubit.myBag.data.cartItems = [];
                      BlocProvider.of<LayoutCubit>(context)
                          .changeCurrentIndex(3);
                      BlocProvider.of<MyOrdersCubit>(context).getOrders();
                      navigatorAndFinish(
                        context,
                        RouteConstant.shopLayoutRoute,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
