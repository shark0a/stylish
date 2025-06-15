import 'package:flutter/material.dart';
import 'package:stylish/utils/validitor_functions.dart';

class PasswordTextFiled extends StatefulWidget {
  const PasswordTextFiled({super.key, required this.hintText});
  final String hintText;

  @override
  State<PasswordTextFiled> createState() => _PasswordTextFiledState();
}

bool obscure = true;

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ? true : false,
      validator: ValiditorFunctions.validatePassword,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff626262)),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF676767),
          fontSize: 15,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        suffixIcon:
            obscure
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      obscure = !obscure;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.visibility_outlined,
                      size: 30,
                      color: Color(0xff626262),
                    ),
                  ),
                )
                : GestureDetector(
                  onTap: () {
                    obscure = !obscure;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 15,
                    ),
                    child: Icon(
                      Icons.visibility_off_outlined,
                      size: 30,
                      color: Color(0xff626262),
                    ),
                  ),
                ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
          child: Icon(Icons.lock, size: 30, color: Color(0xff626262)),
        ),
        fillColor: Color(0xffF3F3F3),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
