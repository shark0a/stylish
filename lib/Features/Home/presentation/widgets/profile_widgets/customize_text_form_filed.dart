import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CustomizeTextFormFiled extends StatelessWidget {
  const CustomizeTextFormFiled({
    super.key,
    this.textEditingController,
    this.obscureText,
    this.validator,
  });
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
      obscureText: obscureText ?? false,
      controller: textEditingController,
      cursorColor: Color(0xff4392F9),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        height: 1.69,
        letterSpacing: 0.07,
      ),

      decoration: InputDecoration(
        fillColor: AppStyles.primaryBackgroungColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffC8C8C8)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffC8C8C8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffC8C8C8)),
        ),
      ),
    );
  }
}
