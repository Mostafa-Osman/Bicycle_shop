import 'package:flutter/material.dart';

import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PromoCode extends StatelessWidget {
  final promoCodeControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width - 250,
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: CustomTextFormField(
            controller: promoCodeControl,
            roundedRectangleBorder: 7.0,
            textHint: 'promo code',
            backgroundColor: const Color(0xfff2f2f2),
          ),
        ),
        const SizedBox(width: 15.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(15.0),
            ),
          ),
          child: MaterialButton(
            color: mainColor,
            onPressed: () {},
            child: const Text(
              'Check code',
              style: TextStyle(
                fontSize: 15,
                color: white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
