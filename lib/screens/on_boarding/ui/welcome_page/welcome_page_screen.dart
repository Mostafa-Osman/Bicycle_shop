// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:udemy_flutter/route/route_constants.dart';
// import 'package:udemy_flutter/screens/login/ui/login.dart';
// import 'package:udemy_flutter/screens/register/register.dart';
// import 'package:udemy_flutter/shared/components/component.dart';
//
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //global size
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: null,
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             //design in top left of page (image)
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/main_top.png",
//                 width: size.width * 0.3,
//               ),
//             ),
//             //design in bottom left of page (image)
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/main_bottom.png",
//                 width: size.width * 0.2,
//               ),
//             ),
//
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //text Welcome Back
//                 defaultText(
//                     text: 'Welcome Back',
//                     textColor: Colors.deepPurple,
//                     fontSize: 20),
//
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 //icons
//                 SvgPicture.asset(
//                   "assets/icons/chat.svg",
//                   height: size.height * 0.45,
//                 ),
//
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//
//                 defaultRaisedButton(
//                   child: 'Login',
//                   roundedRectangleBorder: 25,
//                   background: Color.fromRGBO(153, 51, 255, 1),
//                   onPress: () => navigateTo(context, RouteConstant.loginRoute),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.02,
//                 ),
//                 //Register button
//                 defaultRaisedButton(
//                   child: 'Register',
//                   roundedRectangleBorder: 25,
//                   background: Color.fromRGBO(153, 51, 255, 1),
//                   onPress: () => navigateTo(context, RouteConstant.registerRoute),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
