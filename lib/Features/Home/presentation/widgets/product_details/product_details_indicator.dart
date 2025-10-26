import 'package:flutter/material.dart';

class ProductDetailsIndicator extends StatelessWidget {
  const ProductDetailsIndicator({super.key, required this.active});
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 10 : 8,
      height: active ? 10 : 8,
      decoration: ShapeDecoration(
        color: active ? Color(0xffF83758) : Color(0xffDEDBDB),
        shape: CircleBorder(),
      ),
    );
  }
}
