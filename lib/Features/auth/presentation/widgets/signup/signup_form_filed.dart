import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/screens/signup_page.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/utils/validitor_functions.dart';

class SignupFormFiled extends StatelessWidget {
  const SignupFormFiled({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: ValiditorFunctions.validateEmail,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff626262)),
              ),
              hintText: 'Username or Email',
              hintStyle: TextStyle(
                color: const Color(0xFF676767),
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 15,
                ),
                child: Icon(Icons.person, size: 30, color: Color(0xff626262)),
              ),
              fillColor: Color(0xffF3F3F3),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          PasswordTextFiled(hintText: 'Password'),
          SizedBox(height: 30),
          PasswordTextFiled(hintText: 'ConfirmPassword'),
          SizedBox(height: 19),
          RegisterAgreegation(),
          SizedBox(height: 40),
          CustomizeAuthButton(
            title: 'Create Account',
            onTap: () {
              if (formkey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
