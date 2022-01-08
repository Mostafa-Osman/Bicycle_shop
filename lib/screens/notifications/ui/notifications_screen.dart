import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/screens/notifications/notification_cubit/states.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationStates>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! NotificationsLoadingState &&
                state is! NotificationsErrorState,
            builder: (context) => ListView.builder(
                itemBuilder: (context, index) => ListProduct(
                    model: NotificationCubit.get(context)
                        .notifications!
                        .data!
                        .notificationData[index]),
                itemCount: NotificationCubit.get(context)
                    .notifications!
                    .data!
                    .notificationData
                    .length),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
          );
        },
        listener: (context, state) {});
  }
}

class ListProduct extends StatelessWidget {
  final model;

  const ListProduct({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(top:10.0,right: 10.0,left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                model.message,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              myDivider(thickness: 1.0, color: mainColor),
            ],
          ),
        ),

    );
  }
}
