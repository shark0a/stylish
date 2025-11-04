import 'package:flutter/material.dart';

class ProductDetailsSubTitleWidget extends StatelessWidget {
  const ProductDetailsSubTitleWidget({
    super.key,
    required this.title,
    required this.fontsize,
    this.fontWeight,
  });
  final String title;
  final double fontsize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontsize,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 1.14,
      ),
    );
  }
}
