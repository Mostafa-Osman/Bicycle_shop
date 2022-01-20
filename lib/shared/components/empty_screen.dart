import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

import 'package:udemy_flutter/shared/styles/color.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: SvgPicture.asset('assets/images/empty.svg',
                  fit: BoxFit.fitWidth, height: 250),
            ),
            CustomCard(
              widget: Column(
                children: [
                  CustomText(text: 'Empty!', textColor: red),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: CustomText(
                        text: 'Looks like you haven\'t add any item yet.',
                        fontSize: 18,
                        textColor: grey),
                  ),
                  CustomButton(
                    text: 'Shop now',
                    onPressed: () {
                      LayoutCubit.get(context).changeCurrentIndex(2);
                      navigateTo(context, RouteConstant.shopLayoutRoute);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
