import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

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
                child: CustomLoading()),
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
    return  Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: CustomCard(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: model.title, fontSize: 18, fontWeight: FontWeight.bold),
                SizedBox(height: 10),
                CustomText(
                  text: model.message,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
    );


  }
}
