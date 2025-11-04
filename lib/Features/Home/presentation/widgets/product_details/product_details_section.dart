import 'package:flutter/material.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
            TextSpan(
              text: ' ...',
              style: TextStyle(
                color: const Color(0xFF828282),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
            TextSpan(
              text: 'More',
              style: TextStyle(
                color: const Color(0xFFF97189),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
