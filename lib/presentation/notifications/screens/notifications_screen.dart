import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/presentation/notifications/widgets/notification_item.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

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
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 16.0,
                  offset: Offset(0.0, 1.0),
                )
              ],),
            child: ListView.separated(
              itemBuilder: (context, index) => NotificationItem(
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
