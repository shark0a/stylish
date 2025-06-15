import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/login/login_form_fileds.dart';
import 'package:stylish/Features/auth/presentation/widgets/or_continue_with_column.dart';
import 'package:stylish/utils/app_routs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: const SizedBox(height: 40)),
              AuthHeader(title: "Welcome \nBack!\n"),
              SizedBox(height: 30),
              LoginFormFileds(),
              SizedBox(height: 30),
              OrContinueWithColumn(
                onTap: () {
                  context.push(AppRoutes.kSignUpScreen);
                },
                text: 'Create An Account',
                subtext: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
