import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/showd_details_price.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: (PaymentCubit.get(context).estimatePrice != null),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(right: 10.0, left: 15.0, top: 10),
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text:
                        ' Total: ${PaymentCubit.get(context).estimatePrice!.data!.total!.ceil()} EGP',
                    fontSize: 18.0,
                    textColor: mainColor,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: 'show details',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowDetailsPrice(
                              detailsPrice: PaymentCubit.get(context)
                                  .estimatePrice!
                                  .data!);
                        }),
                  ),
                ],
              ),
              CustomButton(
                text: 'Complete orders now',
                onPressed: () {
                  if (AddressCubit.get(context)
                      .addressModel!
                      .data!
                      .data!
                      .isEmpty) {
                    showToast(
                        state: ToastStates.WARNING,
                        message: 'please add address');
                  } else {
                    PaymentCubit.get(context).makeOrderData(
                      AddressCubit.get(context)
                          .addressModel!
                          .data!
                          .data![PaymentCubit.get(context).addressIndex]
                          .id,
                      PaymentCubit.get(context).isOnline ? 2 : 1,
                      PaymentCubit.get(context).discountTabTextIndexSelected ==
                              0
                          ? true
                          : false,
                    );
                    BasketCubit.get(context).myBag!.data!.cartItems = [];
                    LayoutCubit.get(context).changeCurrentIndex(3);
                    navigatorAndFinish(context, RouteConstant.shopLayoutRoute);
                  }
                },
              ),
            ],
          ),
        );
      },
      fallback: (context) => Center(
        child: CustomLoading(),
      ),
    );
  }
}
