import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/profile/widgets/item_account_text_from_field.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';


class UserDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
          child: CustomText(
            text: userData.data.name, overflow: TextOverflow.clip,),
        ),
        AccountTextFormField(
          text: userData.data.phone,
          icon: Icons.phone,
        ),
        AccountTextFormField(
          text: userData.data.email,
          icon: Icons.email,
        )
      ],
    );
  }
}
