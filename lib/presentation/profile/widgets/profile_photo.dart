import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfilePhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var userInformation = userData!.data;

    return   Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: black,
          width: 1.3,
        ),
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ClipOval(
            child: Image.network(
              userInformation!.image!,
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
