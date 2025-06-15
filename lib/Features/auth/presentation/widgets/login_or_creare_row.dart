import 'package:flutter/material.dart';

class LoginOrCreareRow extends StatelessWidget {
  const LoginOrCreareRow({
    super.key,
    required this.text,
    required this.subtext,
    required this.onTap,
  });
  final String text;
  final String subtext;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$text    ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF575757),
            fontSize: 15,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtext,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFFF73658),
              decorationThickness: 1.5,
              color: const Color(0xFFF73658),
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
