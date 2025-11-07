import 'package:flutter/material.dart';

class ProductDetailsTitleWidget extends StatelessWidget {
  const ProductDetailsTitleWidget({
    super.key,
    required this.title,
    required this.fontsize,
    this.fontWeight,
    this.textAlign,
  });
  final String title;
  final double fontsize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontsize,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 1.10,
      ),
    );
  }
}
