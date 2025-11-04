import 'package:flutter/material.dart';

class ProductDetailsNesrContainer extends StatelessWidget {
  const ProductDetailsNesrContainer({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff828282)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xff828282), size: 14),
          SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF828282),
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.60,
            ),
          ),
        ],
      ),
    );
  }
}
