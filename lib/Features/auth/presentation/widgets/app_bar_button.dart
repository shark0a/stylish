import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.fontsize,
  });
  final String title;
  final double fontsize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          color: Color(0xffF83758),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.white,
              fontSize: fontsize,
              height: 1,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
