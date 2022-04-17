import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget? content;
  final Color backgroundColor;
  final double height;
  final Widget widget;
  final Widget? bottomWidget;

  const CustomAlertDialog({
    this.content,
    this.backgroundColor = Colors.transparent,
    required this.height,
    this.bottomWidget,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      // contentPadding:  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      insetPadding: const EdgeInsets.symmetric(vertical: 50),
      content: Container(
        width: 300,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            widget,
            Expanded(
              child: SizedBox(width: double.infinity, child: bottomWidget),
            )
          ],
        ),
      ),
    );
  }
}
