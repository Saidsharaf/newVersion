import 'package:flutter/material.dart';

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
}) {
  return TextFormField(
    obscureText: hidePassword,
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
