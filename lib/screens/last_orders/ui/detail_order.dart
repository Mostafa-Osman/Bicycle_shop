// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/my_orders_cubit.dart';
// import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/states.dart';
// import 'package:udemy_flutter/shared/components/custom%20_card.dart';
// import 'package:udemy_flutter/shared/components/custom_text.dart';
//
// class DetailOrder extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MyOrdersCubit,MyOrdersStates>(builder:(context,state){
//       return Scaffold(
//         body: Container(
//
//           child:CustomCard(
//             widget: Container(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CustomText(text: 'Order number: ${order.id}', fontSize: 15),
//                       Spacer(),
//                       CustomText(text: 'Date:${order.date}', fontSize: 12),
//                     ],
//                   ),
//
//                       CustomText(text: 'Status: ${order.status}', fontSize: 15),
//             CustomText(text: 'Status: ${order.status}', fontSize: 15),
//             CustomText(text: 'Status: ${order.status}', fontSize: 15),
//             CustomText(text: 'Status: ${order.status}', fontSize: 15),
//             CustomText(text: 'Status: ${order.status}', fontSize: 15),
//
//
//           ),
//                   CustomText(text: 'Total: ${order.total} EGP', fontSize: 15),
//                 ],
//
//
//               ),
//             ),
//           ) ,
//         ),
//       );
//     } , listener:(context,state)=>{})
//   }
// }
