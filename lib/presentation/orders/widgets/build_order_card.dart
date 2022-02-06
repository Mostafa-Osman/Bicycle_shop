import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BuildOrderCard extends StatelessWidget {
  final order;

  BuildOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          widget: InkWell(
            onTap: () => navigateWithArgument(
                context, RouteConstant.orderDetailsRoute, order.id),
            child: Container(
              height: 90,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: 'Order number : ${order.id}', fontSize: 15),
                      SizedBox(width: 50),
                      CustomText(text: 'Date :${order.date}', fontSize: 12),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Status : ${order.status}', fontSize: 15),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, color: mainColor),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomDotedLine(dashColor:lightMainColor),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomText(
                          text: 'Total : ', textColor: mainColor, fontSize: 20),
                      Spacer(),
                      CustomText(text: '${order.total} EGP', fontSize: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}