import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/address_details.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/cancel_order.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/details_order.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/products_order_details.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  final orderId;

  OrderDetailsScreen({required this.orderId});

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context)=>OrderDetailsCubit()..getOrderDetails(orderId),
      child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) {
            if (state is OrderDetailsError) {
              showToast(message: state.errorMessage, state: ToastStates.ERROR);
            }
          },
          builder: (context, state) {
            final orderDetailsCubit = BlocProvider.of<OrderDetailsCubit>(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: CustomText(text: 'Details Order', textColor: mainColor),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
                ),
              ),
              body: ConditionalBuilder(
                condition: (orderDetailsCubit.orderDetails != null),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 10.0, left: 10.0, bottom: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //details order
                          DetailsOrder(),
                          //address
                          AddressDetails(),
                          //product order details
                          ProductsOrderDetails(),
                          // cancel order
                          SizedBox(height: 10),
                          if (orderDetailsCubit.orderDetails!.status == 'New')
                            CancelOrder(),
                        ],
                      ),
                    ),
                  );
                },
                fallback: (context) => Center(
                  child: CustomLoading(),
                ),
              ),
            );
          },
        ),
    )
    ;
  }
}
