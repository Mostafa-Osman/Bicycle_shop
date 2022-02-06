import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AddressDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit =OrderDetailsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: InkWell(
        onTap: () =>
            cubit.changeAddressVisibility(),
        child: CustomCard(
          widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                        text: 'Address',
                        fontSize: 20,
                        textColor: mainColor),
                    Spacer(),
                    cubit.isAddressVisible
                        ? Icon(
                        Icons
                            .keyboard_arrow_up_outlined,
                        size: 35,
                        color: mainColor)
                        : Icon(
                        Icons
                            .keyboard_arrow_down_outlined,
                        size: 35,
                        color: mainColor),
                  ],
                ),
                if (cubit.isAddressVisible)
                  CustomDotedLine(),
                if (cubit.isAddressVisible)
                  Row(
                    children: [
                      CustomText(
                          text: 'city : ',
                          fontSize: 20,
                          textColor: mainColor),
                      CustomText(
                        text:
                        '${cubit.orderDetails!.address!.city}',
                        fontSize: 18,
                      ),
                    ],
                  ),
                if (cubit.isAddressVisible)
                  Row(
                    children: [
                      CustomText(
                          text: 'region : ',
                          fontSize: 20,
                          textColor: mainColor),
                      CustomText(
                        text:
                        '${cubit.orderDetails!.address!.region}',
                        fontSize: 18,
                      ),
                    ],
                  ),
                if (cubit.isAddressVisible)
                  Row(
                    children: [
                      CustomText(
                          text: 'more details : ',
                          fontSize: 20,
                          textColor: mainColor),
                      CustomText(
                        text:
                        '${cubit.orderDetails!.address!.details}',
                        fontSize: 18,
                      ),
                    ],
                  ),
                SizedBox(height: 10.0),
              ]),
        ),
      ),
    );
  }
}
