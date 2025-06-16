import 'package:flutter/material.dart';
import 'package:stylish/utils/validitor_functions.dart';

class CustomizeTextFiled extends StatelessWidget {
  const CustomizeTextFiled({
    super.key,
    required this.hintText,
    required this.icon,
  });
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: ValiditorFunctions.validateEmail,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF676767),
          fontSize: 15,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
          child: Icon(icon, size: 30, color: Color(0xff626262)),
        ),
        fillColor: Color(0xffF3F3F3),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}
