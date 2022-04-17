import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

import 'package:udemy_flutter/shared/styles/color.dart';


class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: SvgPicture.asset(
                'assets/images/empty.svg',
                fit: BoxFit.fitWidth,
                height: 250,
              ),
            ),
            CustomCard(
              widget: Column(
                children: [
                  const CustomText(text: 'Empty!', textColor: red),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: CustomText(
                      text: "Looks like you haven't add any item yet.",
                      fontSize: 18,
                      textColor: grey,
                    ),
                  ),
                  CustomButton(
                    text: 'Shop now',
                    onPressed: () {
                      BlocProvider.of<LayoutCubit>(context)
                          .changeCurrentIndex(2);
                      navigateTo(context, RouteConstant.shopLayoutRoute);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
