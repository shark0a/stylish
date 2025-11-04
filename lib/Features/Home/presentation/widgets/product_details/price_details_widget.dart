import 'package:flutter/material.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
    this.pricewithOutDiscount,
    this.pricewithDiscount,
    this.discountpresentage,
  });
  final double? pricewithOutDiscount;
  final double? pricewithDiscount;
  final double? discountpresentage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pricewithOutDiscount == null
              ? ''
              : '₹${pricewithOutDiscount!.toStringAsFixed(2)}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: const Color(0xFF808488),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.14,
          ),
        ),
        SizedBox(width: 8),
        Text(
          pricewithDiscount == null
              ? ''
              : '₹${pricewithDiscount!.toStringAsFixed(2)}',

          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            height: 1.14,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          discountpresentage == null ? '' : '${discountpresentage!}% OFF',
          style: TextStyle(
            color: const Color(0xFFF97189),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 1.14,
          ),
        ),
      ],
    );
  }
}
