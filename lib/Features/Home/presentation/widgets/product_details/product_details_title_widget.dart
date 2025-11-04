import 'package:flutter/material.dart';

class ProductDetailsTitleWidget extends StatelessWidget {
  const ProductDetailsTitleWidget({
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
    return SizedBox(
      width: 148,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontsize,
          fontFamily: 'Montserrat',
          fontWeight: fontWeight ?? FontWeight.w600,
          height: 1.10,
        ),
      ),
    );
  }
}
