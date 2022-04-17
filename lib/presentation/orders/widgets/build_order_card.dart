import 'package:flutter/material.dart';
import 'package:udemy_flutter/data/models/orders_model/my_orders.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BuildOrderCard extends StatelessWidget {
  final OrderData order;

  const BuildOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          widget: InkWell(
            onTap: () => navigateWithArgument(
                context, RouteConstant.orderDetailsRoute, order.id,),
            child: Container(
              height: 90,
              width: double.infinity,
              margin:const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: 'Order number : ${order.id}', fontSize: 15,),
                      const    SizedBox(width: 50),
                      CustomText(text: 'Date :${order.date}', fontSize: 12),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Status : ${order.status}', fontSize: 15,),
                      const Spacer(),
                      const  Icon(Icons.arrow_forward_ios_outlined, color: mainColor),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const  CustomDotedLine(dashColor:lightMainColor),
                  const
                  SizedBox(height: 10),
                  Row(
                    children: [
                      const CustomText(
                          text: 'Total : ', textColor: mainColor, fontSize: 20,),
                      const  Spacer(),
                      CustomText(text: '${order.total} EGP', fontSize: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const  SizedBox(height: 10),
      ],
    );
  }
}
