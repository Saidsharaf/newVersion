import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildTextFormField({
  @required String? text,
  IconData? prefIcon,
  IconData? sufIcon,
  TextInputType? textInputType,
  TextInputAction? textInputAction,
  @required TextEditingController? textEditingController,
  bool hidePassword = false,
  String? Function(String?)? validate,
  void Function()? onpressSuf,
  void Function(String)? onsubmit,
  VoidCallback? ontap,
}) {
  return TextFormField(
    obscureText: hidePassword,
    onFieldSubmitted: onsubmit,
    onTap: ontap,
    controller: textEditingController,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    style: TextStyle(
      fontFamily: "Body",
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    cursorColor: Colors.grey,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(
        left: 1,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
        ),
      ),
      suffixIcon: IconButton(
        onPressed: onpressSuf,
        icon:  Icon(
          sufIcon,
          color: Colors.grey,
        ),
      ),
      prefix: Icon(
        prefIcon,
        color: Colors.grey,
      ),
      label: Text(
        text!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 23, 184, 109),
        ),
      ),
    ),
    validator: validate,
  );
}


void showToast({
  @required String? msg,
  @required toastStates? state,
}) {
  Fluttertoast.showToast(
      msg: msg!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state!),
      textColor: Colors.white,
      fontSize: 13.0,
      );
}

enum toastStates { SUCCESS, WARNING, ERROR }

Color chooseToastColor(toastStates state) {
  Color color;
  switch (state) {
    case toastStates.SUCCESS:
      color = Colors.green;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
