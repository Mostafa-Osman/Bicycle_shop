import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/notification_model/notifications_model.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationData =
        BlocProvider.of<NotificationCubit>(context);
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
          return ListView.builder(
            itemBuilder: (context, index) => ListProduct(
              model: notificationData.notifications.notificationData[index],
            ),
            itemCount: notificationData.notifications.notificationData.length,
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CustomCard(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: model.title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            CustomText(
              text: model.message,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
