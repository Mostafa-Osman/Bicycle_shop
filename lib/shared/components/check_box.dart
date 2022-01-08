import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final Function onChange;
  final String? subtitle;

  const CustomCheckBox(
      {required this.title,
      required this.value,
      required this.onChange,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      subtitle: Text(subtitle!),
      value: value,
      onChanged: onChange(),
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
