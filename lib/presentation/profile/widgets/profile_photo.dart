import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class ProfilePhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.3,
        ),
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ClipOval(
            child: Image.network(
              userData.data.image,
              height: 115,
              width: 115,
              fit: BoxFit.cover,
            ),),
      ),
    );
  }
}
