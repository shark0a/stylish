import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/screens/login_screen.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/login/app_bar_buttons.dart';
import 'package:stylish/Features/auth/presentation/widgets/or_continue_with_column.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/signup_form_filed.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(top: true, child: SizedBox()),
              AppBarButtons(),
              SizedBox(height: 30),
              AuthHeader(
                title: S.of(context).AuthSignupHeaderTitle,
                color: Colors.black,
              ),
              SizedBox(height: 30),
              SignupFormFiled(),
              SizedBox(height: 15),
              OrContinueWithColumn(
                onTap: () {
                  context.push(AppRoutes.kLoginscreen);
                },
                text: S.of(context).OrContinueWithSignupColumnTitle,
                subtext: S.of(context).OrContinueWithSignupColumnsubtext,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
