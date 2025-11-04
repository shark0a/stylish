import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ProductDetailsViewSimilarContainer extends StatelessWidget {
  const ProductDetailsViewSimilarContainer({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: ShapeDecoration(
        color: AppStyles.primaryBackgroungColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppStyles.d9D9D9),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppStyles.primaryTextgColor, size: 22),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.14,
            ),
          ),
        ],
      ),
    );
  }
}
