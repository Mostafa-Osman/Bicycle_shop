import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: '',//'Language',
          textColor: mainColor,
          fontSize: 20.0,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: const Center(
        child: CustomText(text: 'Coming soon', textColor: grey),
      ),
    );
  }
}
