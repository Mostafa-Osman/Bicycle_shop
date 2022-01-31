import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/screens/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/basket/model/basket_model.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(context);

    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 15.0, top: 10),
      height: 110.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: ' Total: ${BasketCubit.get(context).myBag!.data!.total} EGP',
            fontSize: 18.0,
            textColor: mainColor,
            // backgroundColor: Colors.orangeAccent[100],
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomButton(
            text: 'Complete orders now',
            onPressed: () {
              PaymentCubit.get(context).makeOrderData(
                AddressCubit.get(context)
                    .addressModel!
                    .data!
                    .data![PaymentCubit.get(context).addressIndex]
                    .id,
                cubit.isOnline ? 1 : 0,
                true,
              );

            },

          )
        ],
      ),
    );
  }
}
