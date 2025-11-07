import 'package:flutter/material.dart';

class ProductDetailsSubTitleWidget extends StatelessWidget {
  const ProductDetailsSubTitleWidget({
    super.key,
    required this.title,
    required this.fontsize,
    this.fontWeight, this.color, this.textDecoration,
  });
  final String title;
  final double fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        decoration: textDecoration,
        color: color ?? Colors.black,
        fontSize: fontsize,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 1.14,
      ),
    );
  }
}
