import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 95,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 36,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          height: 1.19,
        ),
      ),
    );
  }
}
