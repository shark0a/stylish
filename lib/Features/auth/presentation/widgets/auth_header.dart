import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 83,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          height: 1.19,
        ),
      ),
    );
  }
}
