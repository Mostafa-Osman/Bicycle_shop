import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';


// Widget Text
Widget defaultText({
  // required text
  required String text,
  //initial font size 25
  double fontSize = 25,
  //initial TextAlign center
  TextAlign textAlign = TextAlign.center,
  //initial FontWeight bold
  FontWeight fontWeight = FontWeight.bold,
  //initial Text color black
  Color textColor = Colors.black,

  //initial Text backgroundColor white
  // Color backgroundColor = Colors.white,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          // backgroundColor: backgroundColor
      ),
    );

//Widget Text Button
Widget defaultTextButton({
  // required text
  required String text,
  // required Function (Action happen when press in text)
  required Function onPress,
  //initial font size 15
  double fontSize = 15,
  //initial TextAlign center
  TextAlign textAlign = TextAlign.center,
  //initial FontWeight bold
  FontWeight fontWeight = FontWeight.bold,
  //initial Text color black
  Color textColor = Colors.black,
}) =>
    TextButton(
      child: defaultText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        textAlign: textAlign,
      ),
      onPressed: () => onPress(),
    );

//Widget TextFromField
Widget defaultTextFromField({
  //required controller
  required TextEditingController controller,
  //validator
  FormFieldValidator<String>? validator,
  //Hint text
  String? textHint,
  //Hint color (initial color black)
  Color hintColor = Colors.black,
  //Text color (initial color black)
  Color textColor = Colors.black,
  //background color (initial color white)
  Color backgroundColor = Colors.white,
  // prefix Icon
  Icon? prefix,
  //Rounded Rectangle Border (initial 25.0)
  double roundedRectangleBorder = 25.0,
  //obscure Text
  bool obscureText = false,
  //Widget suffix Icon
  Widget? suffixIcon,
  //Text Input Type (keyboard Type)
  TextInputType? keyboardType,
  //label
  String? label,
  Key? key,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      key:key,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        fillColor: backgroundColor,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedRectangleBorder),
        ),
        prefixIcon: prefix,

        hintStyle: TextStyle(color: hintColor),
        // icon: icon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );



void showToast({required String message, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.red,
        fontSize: 16.0);
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}



void navigateTo(context, route) => Navigator.pushNamed(
  context,
  route,
);

void navigatorAndFinish(context, route) => Navigator.of(context)
    .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

void navigateWithArgument(context, route, argument) =>
    Navigator.pushNamed(context, route, arguments: argument);

Widget defaultSmoothPageIndicator({required count, controller}) =>
    SmoothPageIndicator(
      count: count,
      controller: controller,
      effect: WormEffect(activeDotColor: Colors.purpleAccent),
    );

Widget myDivider({color,thickness}) => Divider(color: color,thickness:thickness);

