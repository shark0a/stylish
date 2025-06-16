import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo_implementation.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/core/utils/app_routs.dart';

class LoginFormFileds extends StatefulWidget {
  const LoginFormFileds({super.key});

  @override
  State<LoginFormFileds> createState() => _LoginFormFiledsState();
}

class _LoginFormFiledsState extends State<LoginFormFileds> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomizeTextFiled(hintText: 'Username or Email', icon: Icons.person),
          SizedBox(height: 30),
          PasswordTextFiled(hintText: 'Password'),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () => context.push(AppRoutes.kForgetPasswordScreen),
            child: SizedBox(
              width: 390,
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFF73658),
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          CustomizeButton(
            title: 'Login',
            onTap: () {
              if (formkey.currentState!.validate()) {}
              AuthRepoImplementation().signUp('Ahmed@yahoo.com', '111111111');
            },
          ),
        ],
      ),
    );
  }
}
