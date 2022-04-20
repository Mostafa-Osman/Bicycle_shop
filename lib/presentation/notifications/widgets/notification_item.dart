import 'package:flutter/material.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class NotificationItem extends StatelessWidget {
  final NotificationData model;

  const NotificationItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0 ),
      padding: const EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0),
      decoration: BoxDecoration(
        color: const Color(0xFFC4C4C4).withOpacity(0.2),
        border: const Border(
          left: BorderSide(width: 3.0, color: mainColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: model.title,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 5.0),
          CustomText(
            text: model.message,
            fontSize: 12,
            textColor: Colors.black54,
          ),
        ],
      ),
    );
  }
}
