import 'package:flutter/material.dart';


class CustomAlertDialog extends StatelessWidget {
  final Widget? content;
  final Color backgroundColor;
  final double height;
  final Widget widget;
  final Widget? bottomWidget;

  CustomAlertDialog(
      {this.content,
      this.backgroundColor = Colors.transparent,
      required this.height,
       this.bottomWidget,
      required this.widget,
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      insetPadding: EdgeInsets.symmetric(vertical: 50),
      content: Container(
        width: 300,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            SizedBox(height: 25),
            widget,

            Expanded(
                child: Container(width: double.infinity, child: bottomWidget))
          ],
        ),
      ),
    );
  }
}
