import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(top: true, child: SizedBox(height: 40)),
            AuthHeader(title: 'Forgot\npassword?'),
            SizedBox(height: 30),
            CustomizeTextFiled(
              hintText: 'Enter your email address',
              icon: Icons.email,
            ),
            SizedBox(height: 25),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: const Color(0xFFFF4B26),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' We will send you a message to set or reset\n your new password',
                    style: TextStyle(
                      color: const Color(0xFF676767),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            CustomizeButton(onTap: () {}, title: 'Submit'),
          ],
        ),
      ),
    );
  }
}
