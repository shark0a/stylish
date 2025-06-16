import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/or_continue_with_column.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/signup_form_filed.dart';
import 'package:stylish/core/utils/app_routs.dart';

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
              SafeArea(top: true, child: SizedBox(height: 20)),
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
              SafeArea(bottom: true, child: SizedBox(height: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
