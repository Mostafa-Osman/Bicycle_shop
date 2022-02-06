import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class DetailsOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var orderDetails =OrderDetailsCubit.get(context).orderDetails;

    return   CustomCard(
      widget: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                    text: 'Order number : ',
                    fontSize: 20,
                    textColor: mainColor),
                CustomText(
                  text:
                  '${orderDetails!.id}',
                  fontSize: 18,
                ),
                Spacer(),
                CustomText(
                    text: 'Date :${orderDetails.date}',
                    fontSize: 12),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Status : ',
                      fontSize: 20,
                      textColor: mainColor),
                  CustomText(
                    text: '${orderDetails.status}',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                    text: 'Cost : ',
                    fontSize: 20,
                    textColor: mainColor),
                CustomText(
                  text: '${orderDetails.cost}',
                  fontSize: 18,
                ),
                SizedBox(height: 5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Vat : ',
                      fontSize: 20,
                      textColor: mainColor),
                  CustomText(
                    text: '${orderDetails.vat}',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                    text: 'points discount : ',
                    fontSize: 20,
                    textColor: mainColor),
                CustomText(
                  text: '${orderDetails.discount}',
                  fontSize: 18,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Payment method : ',
                      fontSize: 20,
                      textColor: mainColor),
                  CustomText(
                    text: '${orderDetails.paymentMethod}',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            CustomDotedLine(dashColor: lightMainColor),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Total : ',
                      fontSize: 20,
                      textColor: mainColor),
                  Spacer(),
                  CustomText(
                    text: '${orderDetails.total} EGP',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
