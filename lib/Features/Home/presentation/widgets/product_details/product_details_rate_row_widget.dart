import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/star_rating.dart';

class ProductDetailsRateRowWidget extends StatelessWidget {
  const ProductDetailsRateRowWidget({
    super.key,
    required this.rating,
    this.totalReviews,
  });
  final double rating;
  final double? totalReviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(rating: rating),
        SizedBox(width: 8),
        Text(
          totalReviews == null ? '' : '${totalReviews!.round()}',
          style: TextStyle(
            color: const Color(0xFF828282),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            height: 1.14,
          ),
        ),
      ],
    );
  }
}
