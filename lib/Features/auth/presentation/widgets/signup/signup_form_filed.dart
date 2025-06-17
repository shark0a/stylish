import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/register_agreegation.dart';

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
          CustomizeTextFiled(hintText: 'Username or Email', icon: Icons.person),
          SizedBox(height: 30),
          PasswordTextFiled(hintText: 'Password'),
          SizedBox(height: 30),
          PasswordTextFiled(hintText: 'ConfirmPassword'),
          SizedBox(height: 19),
          RegisterAgreegation(),
          SizedBox(height: 40),
          CustomizeButton(
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
