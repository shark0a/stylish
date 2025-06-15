import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/or_continue_with_column.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/signup_form_filed.dart';
import 'package:stylish/utils/app_routs.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: SizedBox(height: 40)),
              AuthHeader(title: "Create an \naccount"),
              SizedBox(height: 30),
              SignupFormFiled(),

              SizedBox(height: 15),
              OrContinueWithColumn(
                onTap: () {
                  context.push(AppRoutes.kLoginscreen);
                },
                text: 'I Already Have an Account',
                subtext: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterAgreegation extends StatelessWidget {
  const RegisterAgreegation({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          TextSpan(
            text: 'By clicking the ',
            style: TextStyle(
              color: const Color(0xFF676767),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: const Color(0xFFFF4B26),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' button, you agree \nto the public offer',
            style: TextStyle(
              color: const Color(0xFF676767),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
