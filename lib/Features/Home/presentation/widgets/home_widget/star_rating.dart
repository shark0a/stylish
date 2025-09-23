import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({super.key, required this.rating, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double starValue = index + 1;

        if (rating >= starValue) {
          return Icon(Icons.star, color: Colors.amber, size: size);
        } else if (rating > starValue - 1 && rating < starValue) {
          return Stack(
            children: [
              Icon(
                Icons.star_border,
                color: const Color(0xFFBBBBBB),
                size: size,
              ),
              ClipRect(
                clipper: _HalfClipper(rating - (starValue - 1)),
                child: Icon(
                  Icons.star,
                  color: const Color(0xFFBBBBBB),
                  size: size,
                ),
              ),
            ],
          );
        } else {
          return Icon(
            Icons.star_border,
            color: const Color(0xFFBBBBBB),
            size: size,
          );
        }
      }),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  final double percent;

  _HalfClipper(this.percent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percent, size.height);
  }

  @override
  bool shouldReclip(_HalfClipper oldClipper) => oldClipper.percent != percent;
}
