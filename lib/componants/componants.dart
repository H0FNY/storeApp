import 'package:flutter/material.dart';

Widget CustomText({
  String? lable = null,
  String? hint = null,
  Color borderColor = Colors.black,
  Color errorColor = Colors.red,
  Color lableColor = Colors.black,
  Color textColor = Colors.black,
  Icon? suffIcon = null,
  TextEditingController? controller,
  Function(String?)? onsubmit,
  Function(String)? onchange,
  Function()? ontap,
  String? Function(String?)? valid,
  bool obscure=false,
  TextInputType keyboard=TextInputType.text,
}) =>
    TextFormField(
      keyboardType: keyboard,
      obscureText: obscure,
      onTap: ontap,
      controller: controller,
      onFieldSubmitted: onsubmit,
      validator: valid,
      onChanged: onchange,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        suffixIcon: suffIcon,
        labelText: lable,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        labelStyle: TextStyle(
          color: lableColor,
        ),
      ),
    );


Widget CustomButton({
  required String text,
  required VoidCallback onpressed,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize:
        MaterialStateProperty.all<Size>(const Size(double.infinity, 60)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
