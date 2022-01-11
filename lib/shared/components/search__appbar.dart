// import 'package:flutter/material.dart';
// import 'package:udemy_flutter/route/route_constants.dart';
// import 'package:udemy_flutter/screens/search/cubit/cubit.dart';
// import 'package:udemy_flutter/shared/components/navigate.dart';
// import 'package:udemy_flutter/shared/styles/color.dart';
//
// class SearchAppBar extends StatelessWidget {
//   final onTap;
//
//   const SearchAppBar({this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 10.0, left: 10.0),
//       width: double.infinity,
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               autofocus: SearchCubit.get(context).autofocus,
//               onFieldSubmitted: (text) {
//                 SearchCubit.get(context).changeAutofocus();
//                 SearchCubit.get(context).search(text);
//               },
//               onTap:  onTap,
//               decoration: InputDecoration(
//                 fillColor: Colors.grey[100],
//                 filled: true,
//                 contentPadding: EdgeInsets.all(10),
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search...',
//                 hintStyle: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.bold, color: grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: IconButton(
//               onPressed: () =>
//                   navigateTo(context, RouteConstant.favouriteRoute),
//               icon: Icon(Icons.favorite, color: red, size: 40),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
