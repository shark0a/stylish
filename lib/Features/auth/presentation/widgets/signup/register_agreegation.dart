import 'package:flutter/material.dart';

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
