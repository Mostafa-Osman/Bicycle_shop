import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationData = BlocProvider.of<NotificationCubit>(context);
    return BlocBuilder<NotificationCubit, NotificationStates>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(
            child: CustomLoading(),
          );
        } else if (state is NotificationsError) {
          return const Center(
            child: Text('server error'),
          );
        } else {
          return  Container(

            margin: const EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFC4C4C4).withOpacity(0.2),
                  blurRadius: 16.0,
                  offset: const Offset(0.0, 1.0),
                )
              ],),
            child: ListView.separated(
              itemBuilder: (context, index) => ListProduct(
                model: notificationData.notifications.notificationData[index],
              ),
              itemCount: notificationData.notifications.notificationData.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10.0,
              ),
            ),
          );
        }
      },
    );
  }
}

class ListProduct extends StatelessWidget {
  final NotificationData model;

  const ListProduct({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(height:65.0,width: 5.0,color: mainColor,),
          const SizedBox(width: 5.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: model.title,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: model.message,
                  fontSize: 12,
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ],

    );
  }
}
